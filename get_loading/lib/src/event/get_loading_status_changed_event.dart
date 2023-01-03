import 'package:flutter_easyloading/flutter_easyloading.dart';

/// GetLoadingStatusChangedEvent
///
/// fired when loading display status changed
class GetLoadingStatusChangedEvent {
  /// underlying status
  final EasyLoadingStatus status;

  /// is displaying
  bool get isShow {
    return status == EasyLoadingStatus.show;
  }

  /// is hidden
  bool get isHide {
    return status == EasyLoadingStatus.dismiss;
  }

  GetLoadingStatusChangedEvent(this.status);
}