import 'dart:ui';

import 'package:get_loading/get_loading.dart';
import 'package:get_module/get_module.dart';
import 'package:mono_demo/modules/foundation/foundation_module.dart';
import 'package:mono_demo/modules/ui_demo/ui_demo_module.dart';

void main() {
  GetModuleLoader([
    /// third-party modules
    GetLoadingModule(),
    /// project modules
    FoundationModule(),
    UIDemoModule(),
    /// runApp()
    GetMaterialAppModule(
      fallbackLocale: const Locale('en'),
      locale: const Locale('en'),
    ),
  ]);
}
