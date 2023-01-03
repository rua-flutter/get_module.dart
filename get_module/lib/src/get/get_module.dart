import 'dart:async';

import 'package:get/get.dart';
import 'package:get_module/get_module.dart';

/// GetModule
abstract class GetModule extends Module {
  abstract List<GetPage> pages;

  GetModule() {
    Get.moduleConfig.pages.addAll(pages);
  }

  @override
  FutureOr<void> install() {
  }
}