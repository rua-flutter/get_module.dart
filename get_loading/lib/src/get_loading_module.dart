import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_module/get_module.dart';

/// GetLoadingModule
///
/// register [EasyLoading] and translation
class GetLoadingModule extends Module {
  @override
  void install() {
    Get.moduleConfig.builders.add(EasyLoading.init());
    Get.appendTranslations({
      'en': {
        'get.loading.success': 'Success',
        'get.loading.error': 'Failed',
      },
      'zh_CN': {
        'get.loading.success': '成功',
        'get.loading.error': '失败',
      }
    });
  }
}