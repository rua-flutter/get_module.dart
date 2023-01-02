import 'package:flutter_test/flutter_test.dart';

import 'package:get_modular/get_modular.dart';

import 'module/test_module.dart';

void main() {
  group('modular', () {
    test('main', () {
      GetModular([
        TestModule().terminateOnError,
        TestModule().debugOnly,
        TestModule().productionOnly.retryUntilSuccess,
        TestModule(),
        TestModule(),
        GetMaterialAppModule(),
      ]);
    });
  });
}
