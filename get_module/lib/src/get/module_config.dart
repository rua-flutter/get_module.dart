import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// ModuleConfig
class ModuleConfig {
  /// global bindings
  final List<TransitionBuilder> builders = [];

  /// global middlewares
  final List<GetMiddleware> middlewares = [];
}

/// GetModuleConfigExtension
///
/// mount [GetModuleConfigExtension] to [GetInterface]
extension GetModuleConfigExtension on GetInterface {
  static final _moduleConfig = ModuleConfig();

  ModuleConfig get moduleConfig => _moduleConfig;
}
