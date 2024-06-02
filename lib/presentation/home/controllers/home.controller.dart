import 'dart:convert';

import 'package:delta_subur_prima/domain/utils/api_endpoint.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.findData);

  Future<void> scanQRCode() async {
    String qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);

    if (qrCodeResult != null && qrCodeResult.isNotEmpty) {
      // Handle QR code result here
      searchByBarcode(qrCodeResult);
    }
  }

  // Fungsi untuk mencari data produk berdasarkan barcode
  Future<void> searchByBarcode(String barcode) async {
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'barcode': barcode,
        }),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['is_valid'] == true) {
          // _showDataDialog(json['data']);
        } else {
          _showAlertDialog('Error', json['message']);
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknown Error Occured";
      }
    } catch (e) {
      // Tangani error dengan menampilkan pesan atau melakukan sesuai kebutuhan
      print('Error: $e');
    }
  }

  // Method untuk menampilkan AlertDialog dengan data produk
  void _showDataDialog(Map<String, dynamic> data) {
    Get.dialog(
      AlertDialog(
        title: Text('Data Produk'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('ID: ${data['id']}'),
            Text('Jenis Produk: ${data['jenis_produk']['jenis_produk']}'),
            Text('Nama Produk: ${data['nama_produk']}'),
            Text('Harga: Rp.${data['harga']}'),
            Text('Barcode: ${data['barcode']}'),
            // Tambahkan kolom lainnya sesuai kebutuhan
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Tutup AlertDialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  // Method untuk menampilkan AlertDialog dengan pesan error
  void _showAlertDialog(String title, String message) {
    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Tutup AlertDialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
