import 'package:delta_subur_prima/infrastructure/navigation/bindings/controllers/custom_drawer.dart';
import 'package:delta_subur_prima/presentation/auth/login/auth_login.screen.dart';
import 'package:delta_subur_prima/presentation/home/controllers/home.controller.dart';
import 'package:delta_subur_prima/presentation/socket/test_sender/controllers/socket_test_sender.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final homeController = Get.put(HomeController());

  HomeScreen({required this.username});

  void _navigateToGenerateQR(BuildContext context) {
    // Implement navigation logic here
  }

  void _navigateToScanQR(BuildContext context) {
    final SocketTestSenderController controller =
        Get.put(SocketTestSenderController());

    controller.scanQRCode();
  }

  void _navigateToHistory(BuildContext context) {
    // Implement navigation logic here
  }
  void _navigateToLogout(BuildContext context) {
    Get.offAll(() => AuthLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(
        onTapGenerateQR: () => _navigateToGenerateQR(context),
        onTapScanQR: () => _navigateToScanQR(context),
        onTapHistory: () => _navigateToHistory(context),
        onTapLogout: () => _navigateToLogout(context),
        onTapSetting: () => _navigateToHistory(context),
      ),
      body: Center(
        child: Text(
          'HomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
