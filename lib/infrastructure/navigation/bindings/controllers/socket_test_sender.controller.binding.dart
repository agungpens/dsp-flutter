import 'package:get/get.dart';

import '../../../../presentation/socket/test_sender/controllers/socket_test_sender.controller.dart';

class SocketTestSenderControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocketTestSenderController>(
      () => SocketTestSenderController(),
    );
  }
}
