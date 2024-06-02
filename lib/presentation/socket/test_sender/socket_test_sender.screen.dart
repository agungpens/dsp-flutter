import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delta_subur_prima/presentation/socket/test_sender/controllers/socket_test_sender.controller.dart';

class SocketTestSenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SocketTestSenderController controller =
        Get.put(SocketTestSenderController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Send Data to Server'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.sendData('test');
          },
          child: Text('Send Data'),
        ),
      ),
    );
  }
}
