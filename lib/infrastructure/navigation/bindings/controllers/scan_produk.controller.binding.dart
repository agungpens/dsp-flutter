import 'package:get/get.dart';

import '../../../../presentation/scan/produk/controllers/scan_produk.controller.dart';

class ScanProdukControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanProdukController>(
      () => ScanProdukController(),
    );
  }
}
