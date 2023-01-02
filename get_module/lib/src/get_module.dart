import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:get_module/src/get/page_manager.dart';

class GetModular extends Modular {
  GetModular(super.modules, {
    super.autoStart,
  }) {
    Get.put(PageManager());
  }
}