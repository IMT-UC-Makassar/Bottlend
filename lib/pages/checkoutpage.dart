import 'dart:math';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

import '../app_state.dart';

class CheckoutPage extends StatefulWidget {
  final String productDescription;
  final int productPoints;
  final String imagePath;

  CheckoutPage({
    required this.productDescription,
    required this.productPoints,
    required this.imagePath, // Pastikan imagePath disertakan
  });

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _pickupOrDelivery = 'Pickup';
  GlobalKey _globalKey = GlobalKey();

  String _generateRandomBarcode() {
    const length = 12;
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  Future<void> _saveBarcode() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = (await getApplicationDocumentsDirectory()).path;
      final path = '$directory/${DateTime.now().millisecondsSinceEpoch}.png';
      File imgFile = File(path);
      await imgFile.writeAsBytes(pngBytes);

      final result = await ImageGallerySaver.saveFile(imgFile.path);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Barcode saved to gallery: $result')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to save barcode: $e')));
    }
  }

  void _completeCheckout(AppState appState) {
    if (appState.bottlePoint >= widget.productPoints) {
      appState.decrementPoints(widget.productPoints);

      // Add the transaction to the history
      final now = DateTime.now();
      final date = "${now.day}/${now.month}/${now.year}";
      appState.addHistory("Exchanged ${widget.productDescription}", date,
          "${widget.productPoints} Point");

      String barcode = _generateRandomBarcode();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Exchange Successful'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('You have exchanged for ${widget.productDescription}.'),
                SizedBox(height: 20),
                RepaintBoundary(
                  key: _globalKey,
                  child: BarcodeWidget(
                    barcode: Barcode.code128(),
                    data: barcode,
                    width: 200,
                    height: 80,
                  ),
                ),
                SizedBox(height: 10),
                Text('Use this barcode to pick up your item.'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _saveBarcode();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('Save to Gallery'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Insufficient Bottle Points for this product.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout',
            style: TextStyle(color: Color.fromRGBO(24, 146, 24, 1))),
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.imagePath,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.productDescription,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Points Required: ${widget.productPoints}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Choose Delivery Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Pickup'),
              leading: Radio(
                value: 'Pickup',
                groupValue: _pickupOrDelivery,
                onChanged: (String? value) {
                  setState(() {
                    _pickupOrDelivery = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text('Delivery'),
                  SizedBox(width: 10),
                  Text(
                    '(Coming Soon)',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              leading: Radio(
                value: 'Delivery',
                groupValue: _pickupOrDelivery,
                onChanged: null,
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => _completeCheckout(appState),
                child: Text('Confirm Exchange'),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(24, 146, 24, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
