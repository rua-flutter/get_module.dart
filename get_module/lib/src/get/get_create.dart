import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

/// GetCreate
///
/// provide factory inside [GetWidget]
mixin GetCreate<S extends GetLifeCycleBase?> on GetWidget<S> {

  S factory();

  @override
  WidgetCache createWidgetCache() {
    if (!GetInstance().isRegistered<S>()) {
      Get.create(factory);
    }

    return super.createWidgetCache();
  }
}