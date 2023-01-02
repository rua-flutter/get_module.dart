import 'package:flutter/foundation.dart';
import 'package:get_module/get_module.dart';

/// CallbackModule
///
/// use callback as module
class CallbackModule extends Module {
  final VoidCallback callback;

  CallbackModule(this.callback);

  @override
  void install() {
    callback();
  }
}
