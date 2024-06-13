import 'dart:convert';

import 'package:delta_subur_prima/domain/utils/api_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketTestSenderController extends GetxController {
  late IO.Socket socket;

  String socketUrl() {
    // return 'http://34.125.194.3:1234'; // Ganti dengan URL server Anda
    return 'http://34.143.219.34:3000/'; // Ganti dengan URL server ngrok
  }

  var url =
      Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.findData);

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
          sendData(json['data']);
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

  @override
  void onInit() {
    super.onInit();
    connect();
  }

  void connect() {
    // Replace with your server's address and port
    socket = IO.io(socketUrl(), <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    socket.on('connect', (_) {
      print('Connected to the server');
    });

    socket.on('disconnect', (_) {
      print('Disconnected from the server');
    });

    socket.on('receive-data', (data) {
      print('Data received: $data');
    });

    socket.connect();
  }

  void sendData(data) {
    socket.emit('send-data', {'data': data});
  }

  void disconnect() {
    socket.disconnect();
  }

  @override
  void onClose() {
    disconnect();
    super.onClose();
  }
}
