import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanScannerController extends GetxController {
  Future<void> scanQRCode() async {
    String qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);

    if (qrCodeResult != null && qrCodeResult.isNotEmpty) {
      // Handle QR code result here
      print('Scanned QR Code: $qrCodeResult');
    }
  }
}
