import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// ModuleConfig
class ModuleConfig {
  final List<TransitionBuilder> builders = [];

  Widget builder(BuildContext context, Widget? child) {
    Widget? widget = child;

    for (final func in builders) {
      widget = func(context, widget);
    }

    return widget!;
  }
}

extension GetModuleConfigExtension on GetInterface {
  static final _moduleConfig = ModuleConfig();

  ModuleConfig get moduleConfig => _moduleConfig;
}
