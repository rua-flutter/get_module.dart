import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_loading/src/event/get_loading_status_changed_event.dart';

class Loading {
  Loading() {
    EasyLoading.addStatusCallback((status) {
      Get.bus.fire(GetLoadingStatusChangedEvent(status));
    });
  }

  Future<T> call<T>(
    AsyncValueCallback<T> func, {
    bool showSuccess = false,
    bool showError = true,
    String? successText,
    String? errorText,
  }) async {
    try {
      show();
      final result = await func();
      if (showSuccess) {
        success(successText ?? 'get.loading.success'.tr);
      } else {
        hide();
      }
      return result;
    } catch (e) {
      if (showError) {
        error(errorText ?? 'get.loading.error'.tr);
      }
      rethrow;
    }
  }

  /// mount function [EasyLoading.show]
  var show = EasyLoading.show;

  /// mount function [EasyLoading.dismiss]
  var hide = EasyLoading.dismiss;

  /// mount function [EasyLoading.showToast]
  var toast = EasyLoading.showToast;

  /// mount function [EasyLoading.showSuccess]
  var success = EasyLoading.showSuccess;

  /// mount function [EasyLoading.showError]
  var error = EasyLoading.showError;

  /// mount function [EasyLoading.showInfo]
  var info = EasyLoading.showInfo;

  /// mount function [EasyLoading.showProgress]
  var progress = EasyLoading.showProgress;

  @mustCallSuper
  void dispose() {
    EasyLoading.removeAllCallbacks();
  }
}

typedef AsyncValueCallback<T> = FutureOr<T> Function();
