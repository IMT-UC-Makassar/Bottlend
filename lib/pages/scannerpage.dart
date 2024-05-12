import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  String _result = "Hasil scan QR akan ditampilkan di sini";

  @override
  void initState() {
    super.initState();
    _scanQR(); // Panggil metode _scanQR saat initState dipanggil
  }

  Future<void> _scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Warna yang digunakan untuk tanda petunjuk
        "Batal", // Label tombol untuk membatalkan pemindaian
        true, // Gunakan mode kamera yang lebih tinggi resolusinya
        ScanMode.DEFAULT, // Mode pemindaian (default, QR, barcode)
      );
    } catch (e) {
      barcodeScanRes = 'Error: $e';
    }

    if (!mounted) return;

    setState(() {
      _result = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        title: Text('QR Scanner',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(24, 146, 24, 1))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.qr_code_scanner,
              size: 100,
              color:
                  Color.fromRGBO(24, 146, 24, 1), // Warna ikon QR code scanner
            ),
            SizedBox(height: 20),
            Text(
              'Ayo Mulai Pindai!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Scan:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQR,
        icon: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
        label: Text(
          'Scan QR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(24, 146, 24, 1), // Warna tombol
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
