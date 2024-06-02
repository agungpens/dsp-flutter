import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(username: ''),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_LOGIN,
      page: () => AuthLoginScreen(),
      binding: AuthLoginControllerBinding(),
    ),
    GetPage(
      name: Routes.SCAN_SCANNER,
      page: () => ScanScannerScreen(),
      binding: ScanScannerControllerBinding(),
    ),
    GetPage(
      name: Routes.SCAN_PRODUK,
      page: () => ScanProdukScreen(),
      binding: ScanProdukControllerBinding(),
    ),
    GetPage(
      name: Routes.SOCKET_TEST_SENDER,
      page: () => SocketTestSenderScreen(),
      binding: SocketTestSenderControllerBinding(),
    ),
  ];
}
