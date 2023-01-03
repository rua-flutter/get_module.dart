import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// ModuleConfig
class ModuleConfig {
  final List<TransitionBuilder> builders = [];

  /// combine all builders into one builder
  Widget builder(BuildContext context, Widget? child) {
    Widget? widget = child;

    for (final func in builders) {
      widget = func(context, widget);
    }

    return widget!;
  }
}

/// GetModuleConfigExtension
///
/// mount [GetModuleConfigExtension] to [GetInterface]
extension GetModuleConfigExtension on GetInterface {
  static final _moduleConfig = ModuleConfig();

  ModuleConfig get moduleConfig => _moduleConfig;
}
