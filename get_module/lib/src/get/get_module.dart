import 'dart:async';

import 'package:get/get.dart';
import 'package:get_module/get_module.dart';

/// GetModule
abstract class GetModule extends Module {
  /// register module-specified pages
  final List<GetPage> pages = [];

  final Map<String, Map<String, String>> translations = {};

  GetModule() {
    Get.addPages(pages);
    Get.appendTranslations(translations);
  }

  @override
  FutureOr<void> install() {}
}
