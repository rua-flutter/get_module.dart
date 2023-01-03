import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguagePage extends StatelessWidget {
  const ChangeLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('change-language.title'.tr),
      ),
      body: ListView(
        children: [
          ListTile(title: const Text('English'), onTap: () {
            Get.updateLocale(const Locale('en'));
            Get.back();
          }),
          ListTile(title: const Text('中文'), onTap: () {
            Get.updateLocale(const Locale('zh_CN'));
            Get.back();
          }),
        ],
      ),
    );
  }
}
