import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:get_module/src/get/app_config.dart';

/// GetMaterialAppModule
///
/// Module for [GetMaterialApp]
class GetMaterialAppModule extends Module {
  final AppConfig appConfig = Get.find();

  late final Widget app;

  GetMaterialAppModule({
    // route
    Widget? home,
    String? initialRoute,
  }) {
    app = GetMaterialApp(
      home: home,
      initialRoute: initialRoute,
      getPages: appConfig.getPages,
      builder: appConfig.builder,
    );
  }

  @override
  void install() {
    runApp(app);
  }
}
