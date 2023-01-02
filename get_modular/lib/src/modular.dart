import 'package:get/get.dart';
import 'package:get_modular/src/event/before_start_modular_event.dart';
import 'package:get_modular/src/module/module.dart';
import 'package:get_event_bus/get_event_bus.dart';

abstract class Modular {
  final List<Module> modules;

  Modular(this.modules, {
    bool autoStart = true,
  }) {
    if (autoStart) {
      run();
    }
  }

  void run() {
    Get.bus.fire(BeforeStartModularEvent(this));
  }
}