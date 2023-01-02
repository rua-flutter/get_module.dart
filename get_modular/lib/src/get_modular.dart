import 'package:get/get.dart';
import 'package:get_modular/get_modular.dart';
import 'package:get_modular/src/get/page_manager.dart';

class GetModular extends Modular {
  GetModular(super.modules, {
    super.autoStart,
  }) {
    Get.put(PageManager());
  }
}