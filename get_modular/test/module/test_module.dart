
import 'dart:async';

import 'package:get_modular/get_modular.dart';
import 'package:get_modular/src/feature/route_config.dart';

class TestModule extends Module {
  int installedCount = 0;

  @override
  FutureOr install() {
    installedCount++;
  }

  bool get installed {
    return installedCount > 0;
  }
}

class TestUIModule extends Module with RouteConfig {
  @override
  FutureOr<void> install() {
  }
}