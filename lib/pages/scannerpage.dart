import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../app_state.dart';
import 'package:intl/intl.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String _result = "Hasil scan QR akan ditampilkan di sini";

  Future<void> _scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Batal",
        true,
        ScanMode.DEFAULT,
      );
    } catch (e) {
      barcodeScanRes = 'Error: $e';
    }

    if (!mounted) return;

    setState(() {
      _result = barcodeScanRes;
    });

    if (barcodeScanRes != '-1') {
      final appState = AppState.of(context);
      appState.incrementPoints();

      String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
      appState.addHistory('Bottle Scanned', formattedDate, '10 Points');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        title: const Text('QR Scanner',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(24, 146, 24, 1))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.qr_code_scanner,
              size: 100,
              color: Color.fromRGBO(24, 146, 24, 1),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ayo Mulai Pindai!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Hasil Scan:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQR,
        icon: const Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        label: const Text(
          'Scan QR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(24, 146, 24, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
