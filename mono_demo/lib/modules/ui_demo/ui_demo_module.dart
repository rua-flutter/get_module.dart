import 'package:get_module/get_module.dart';

class UIDemoModule extends GetModule {
  @override
  Map<String, Map<String, String>> get translations => {
    'en': {
      'ui-demo.title': "UI DEMO",
      "displaying": 'displaying',
    },
    'zh_CN': {
      'ui-demo.title': "UI DEMO",
      "displaying": 'displaying',
    }
  };
}