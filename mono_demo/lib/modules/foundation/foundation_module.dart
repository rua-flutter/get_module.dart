import 'dart:async';

import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:mono_demo/modules/foundation/page/entry_page.dart';
import 'package:mono_demo/modules/ui_demo/page/controller/ui_demo_controller.dart';

class FoundationModule extends Module {
  @override
  FutureOr<void> install() {
    Get.moduleConfig.routes.add(
      GetPage(
        name: '/',
        page: () => const EntryPage(),
        bindings: [
          BindingsBuilder.put(() => EntryController()),
          BindingsBuilder.put(() => UIDemoController()),
        ]
      ),
    );
  }
}
