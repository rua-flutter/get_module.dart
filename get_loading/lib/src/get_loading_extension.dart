import 'package:get/get.dart';
import 'package:get_loading/src/loading.dart';

/// GetLoadingExtension
///
/// mount [Loading] to [GetInterface]
extension GetLoadingExtension on GetInterface {
  static final _loading = Loading();

  Loading get loading => _loading;
}
