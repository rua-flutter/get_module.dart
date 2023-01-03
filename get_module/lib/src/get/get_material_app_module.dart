import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:get_module/src/get/module_config.dart';

/// GetMaterialAppModule
///
/// Module for [GetMaterialApp]
class GetMaterialAppModule extends Module {
  late final Widget Function() appBuilder;

  GetMaterialAppModule({
    // route
    Widget? home,
    String? initialRoute,
  }) {
    appBuilder = () {
      final moduleConfig = Get.moduleConfig;

      return GetMaterialApp(
        home: home,
        initialRoute: initialRoute,
        getPages: moduleConfig.getPages,
        builder: moduleConfig.getBuilder,
      );
    };
  }

  @override
  void install() {
    runApp(appBuilder());
  }
}
