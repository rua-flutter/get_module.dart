import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_loading/get_loading.dart';

class GetLoadingPart extends StatelessWidget {
  const GetLoadingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Obx(
            () => Text(
              'Get Loading (${'displaying'.tr}: ${Get.loading.isShow})',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 35,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.loading.toast('hi');
                },
                child: const Text('toast'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await Get.loading(() async {
                      await Future.delayed(const Duration(seconds: 3));
                      throw Exception();
                    });
                  },
                  child: const Text('loading'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Get.loading.progress(0);
                    await Future.delayed(const Duration(milliseconds: 300));
                    Get.loading.progress(0.25);
                    await Future.delayed(const Duration(milliseconds: 300));
                    Get.loading.progress(0.5);
                    await Future.delayed(const Duration(milliseconds: 300));
                    Get.loading.progress(0.75);
                    await Future.delayed(const Duration(milliseconds: 300));
                    Get.loading.progress(1);
                    await Future.delayed(const Duration(milliseconds: 300));
                    Get.loading.hide();
                  },
                  child: const Text('progress'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.loading.success('success');
                  },
                  child: const Text('success'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.loading.error('error');
                  },
                  child: const Text('error'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.loading.info('info');
                  },
                  child: const Text('info'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
