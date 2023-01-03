import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_module/get_module.dart';

class GetLoadingModule extends Module {
  @override
  FutureOr<void> install() {
    Get.moduleConfig.builders.add(EasyLoading.init());
  }
}