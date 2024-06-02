import 'package:get/get.dart';

import '../../../../presentation/scan/scanner/controllers/scan_scanner.controller.dart';

class ScanScannerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanScannerController>(
      () => ScanScannerController(),
    );
  }
}
