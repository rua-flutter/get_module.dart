import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_module/get_module.dart';

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
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
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
        supportedLocales: supportedLocales,
      );
    };
  }

  @override
  void install() {
    runApp(appBuilder());
  }
}
