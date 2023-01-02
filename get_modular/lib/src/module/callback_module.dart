import 'package:flutter/foundation.dart';
import 'package:get_modular/get_modular.dart';

class CallbackModule extends Module {
  final VoidCallback callback;

  CallbackModule(this.callback);

  @override
  void install() {
    callback();
  }
}