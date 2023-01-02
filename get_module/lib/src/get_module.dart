import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:get_module/src/get/page_manager.dart';

class GetModuleLoader extends ModuleLoader {
  GetModuleLoader(super.modules, {
    super.autoStart,
  }) {
    Get.put(PageManager());
  }
}