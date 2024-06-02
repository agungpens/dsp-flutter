import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/scan_produk.controller.dart';

class ScanProdukScreen extends GetView<ScanProdukController> {
  const ScanProdukScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScanProdukScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ScanProdukScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
