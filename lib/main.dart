import 'package:delta_subur_prima/infrastructure/navigation/bindings/controllers/custom_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final controllerC = Get.put(CustomController());
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    // Obx
    return Obx(() => GetMaterialApp(
          theme:
              controllerC.isDark.value ? ThemeData.light() : ThemeData.dark(),
          initialRoute: initialRoute,
          getPages: Nav.routes,
        ));
  }
}
