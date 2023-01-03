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
    Locale? locale,
    Locale? fallbackLocale,
  }) {
    appBuilder = () {
      final moduleConfig = Get.moduleConfig;

      return GetMaterialApp(
        home: home,
        initialRoute: initialRoute,
        getPages: [],
        builder: moduleConfig.builders.isNotEmpty ? moduleConfig.builder : null,
        // translationsKeys: moduleConfig.translations,
        locale: locale ?? Get.deviceLocale,
        fallbackLocale: fallbackLocale ?? const Locale('en'),
      );
    };
  }

  @override
  void install() {
    runApp(appBuilder());
  }
}
