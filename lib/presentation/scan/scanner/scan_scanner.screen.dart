import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/scan_scanner.controller.dart';

class ScanScannerScreen extends GetView<ScanScannerController> {
  const ScanScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanScannerScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScanScannerScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.scanQRCode(); // Panggil fungsi dari controller
        },
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
