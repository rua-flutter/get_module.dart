import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:mono_demo/modules/ui_demo/component/get_loading_part.dart';

class UIDemoPage extends StatelessWidget {
  const UIDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ui-demo.title'.tr),
      ),
      body: ListView(
        children: [
          const GetLoadingPart(),
        ],
      ),
    );
  }
}
