import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_module/get_module.dart';

/// RunAppModule
///
/// customized run app module using [appBuilder]
class RunAppModule extends Module {
  final Widget app;

  RunAppModule(this.app);

  @override
  Future<void> install() async {
    runApp(app);
    Get.bus.fire(AppStartedEvent(modular));
  }
}