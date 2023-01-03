import 'dart:async';

import 'package:get/get.dart';
import 'package:get_module/get_module.dart';
import 'package:mono_demo/modules/foundation/page/entry_page.dart';

class FoundationModule extends Module {
  @override
  FutureOr<void> install() {
    Get.moduleConfig.routes.add(
      GetPage(
        name: '/',
        page: () => const EntryPage(),
        bindings: [
          BindingsBuilder.put(() => EntryController()),
        ]
      ),
    );
  }
}
