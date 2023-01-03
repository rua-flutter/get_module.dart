import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_module/src/event/module_loader_finished_event.dart';
import 'package:get_module/src/event/module_loader_started_event.dart';
import 'package:get_module/src/module/module.dart';

/// ModuleLoader
///
/// loads all modules
abstract class ModuleLoader {
  final List<Module> modules;

  /// installed modules types
  final List<Type> installedModules = [];

  /// installing modules
  final List<Module> pendingModules = [];

  /// pending executions may contains finished executions
  @visibleForTesting
  final pendingExecutions = <Future>[];

  /// indicates the loader is running
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

  void run() {
    if (running) {
      return;
    }

    running = true;

    Get.bus.fire(ModuleLoaderStartedEvent(this));

    for (final module in modules) {
      module.moduleLoader = this;
    }

    scanSatisfied();
  }

  Future<void> scanSatisfied() async {
    for (final module in [...modules]) {
      if (module.dependencies.length > installedModules.length) {
        continue;
      }

      if (module.satisfy()) {
        modules.remove(module);
        pendingModules.add(module);
        pendingExecutions.add(runAsync(module));
      }
    }
  }

  Future<void> runAsync(Module module) async {
    await module.run();
    pendingModules.remove(module);
    installedModules.add(module.runtimeType);

    if (modules.isEmpty && pendingModules.isEmpty) {
      pendingExecutions.clear();
      Get.bus.fire(ModuleLoaderFinishedEvent(this));
      return;
    }

    scanSatisfied();
  }
}
