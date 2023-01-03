import 'package:get/get.dart';
import 'package:get_loading/get_loading.dart';
import 'package:get_module/get_module.dart';

void main() async {
  // method 1
  GetModuleLoader([
    GetLoadingModule(),
  ]);

  // method 2
  GetLoadingModule().install();

  Get.loading.show(status: 'text');
  Get.loading.hide(animation: false);

  Get.loading.toast('text');
  Get.loading.success('text');
  Get.loading.error('text');
  Get.loading.info('text');
  Get.loading.progress(0.75, status: 'text');

  final result = await Get.loading(() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return 1;
  });
}