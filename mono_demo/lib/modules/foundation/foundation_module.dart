import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:mono_demo/modules/foundation/page/change_language_page.dart';
import 'package:mono_demo/modules/foundation/page/entry_page.dart';
import 'package:mono_demo/modules/ui_demo/page/controller/ui_demo_controller.dart';

class FoundationModule extends GetModule {
  @override
  List<GetPage> get pages => [
        GetPage(
          name: '/',
          page: () => const EntryPage(),
          bindings: [
            BindingsBuilder.put(() => EntryController()),
            BindingsBuilder.put(() => UIDemoController()),
          ],
        ),
        GetPage(name: '/change-language', page: () => const ChangeLanguagePage()),
      ];

  @override
  Map<String, Map<String, String>> get translations => {
        'en': {
          'tab.widget': 'UI',
          'tab.function': 'Function',
          'tab.native': 'Native',
          'change-language.title': 'Change Language',
        },
        'zh_CN': {
          'tab.widget': 'UI',
          'tab.function': '功能',
          'tab.native': '原生',
          'change-language.title': '修改语言',
        }
      };
}
