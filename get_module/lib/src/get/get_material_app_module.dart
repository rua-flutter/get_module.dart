import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:get_module/src/get/module_config.dart';

/// GetMaterialAppModule
///
/// Module for [GetMaterialApp]
class GetMaterialAppModule extends Module {
  late final Widget app;

  GetMaterialAppModule({
    // route
    Widget? home,
    String? initialRoute,
  }) {
    final moduleConfig = Get.moduleConfig;

    app = GetMaterialApp(
      home: home,
      initialRoute: initialRoute,
      getPages: moduleConfig.getPages,
      builder: moduleConfig.builder,
    );
  }

  @override
  void install() {
    runApp(app);
  }
}
