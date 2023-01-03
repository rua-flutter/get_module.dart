import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mono_demo/modules/ui_demo/page/ui_demo_page.dart';

class EntryController extends GetxController with GetSingleTickerProviderStateMixin {
  final tabIndex = 0.obs;

  late final tabController = TabController(length: 3, vsync: this);

  changeTab(int index) {
    tabIndex.value = index;
    tabController.index = index;
  }
}

class EntryPage extends GetView<EntryController> {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller.tabController,
        children: [
          UIDemoPage(),
          UIDemoPage(),
          UIDemoPage(),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTab,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.screenshot_monitor), label: 'UI'.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.code), label: 'Function'.tr),
            BottomNavigationBarItem(icon: const Icon(Icons.phonelink_rounded), label: 'Native'.tr),
          ],
        );
      }),
    );
  }
}
