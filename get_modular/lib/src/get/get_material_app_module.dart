import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_modular/get_modular.dart';
import 'package:get_modular/src/get/page_manager.dart';

/// GetMaterialAppModule
///
/// Module for [GetMaterialApp]
class GetMaterialAppModule extends Module {
  final PageManager pageManager = Get.find();

  late final Widget app;

  GetMaterialAppModule({
    // route
    Widget? home,
    String? initialRoute,
  }) {
    app = GetMaterialApp(
      home: home,
      initialRoute: initialRoute,
      getPages: pageManager.getPages(),
    );
  }

  @override
  void install() {
    runApp(app);
  }
}
