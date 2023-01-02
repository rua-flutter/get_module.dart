import 'dart:async';

import 'package:get_module/get_module.dart';

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

class TestErrorModule extends Module {
  int installedCount = 0;

  @override
  FutureOr install() {
    installedCount++;
    throw Exception();
  }

  bool get installed {
    return installedCount > 0;
  }
}

// class TestUIModule extends Module with RouteConfig {
//   @override
//   FutureOr<void> install() {
//   }
// }
