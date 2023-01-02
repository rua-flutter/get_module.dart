import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_module/src/event/after_start_module_loader_event.dart';
import 'package:get_module/src/event/before_start_module_loader_event.dart';
import 'package:get_module/src/module/module.dart';

/// ModuleLoader
///
/// loads all modules
abstract class ModuleLoader {
  final List<Module> modules;

  @protected
  @visibleForTesting
  final List<Type> installedModules = [];

  @protected
  @visibleForTesting
  final List<Module> pendingModules = [];

  @protected
  @visibleForTesting
  final pendingExecutions = <Future>[];

  @protected
  @visibleForTesting
  bool running = false;

  ModuleLoader(
    this.modules, {
    bool autoStart = true,
  }) {
    if (autoStart) {
      run();
    }
  }

  Future<void> run() async {
    Get.bus.fire(BeforeStartModuleLoaderEvent(this));
    if (running) {
      return;
    }

    running = true;

    scanSatisfied();

    await Future.doWhile(() async {
      await Future.wait(pendingExecutions);
      return modules.isNotEmpty || pendingModules.isNotEmpty;
    });

    pendingExecutions.clear();
    Get.bus.fire(AfterStartModuleLoaderEvent(this));
  }

  Future<void> scanSatisfied() async {
    for (final module in [...modules]) {
      if (module.dependencies.length < installedModules.length) {
        continue;
      }

      if (module.dependencies.every((el) => installedModules.contains(el))) {
        modules.remove(module);
        pendingModules.add(module);
        pendingExecutions.add(runAsync(module));
      }
    }
  }

  Future<void> runAsync(Module module) async {
    module.moduleLoader = this;
    await module.run();
    pendingModules.remove(module);
    installedModules.add(module.runtimeType);
    scanSatisfied();
  }
}
