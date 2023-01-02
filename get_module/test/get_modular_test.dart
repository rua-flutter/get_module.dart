import 'package:flutter_test/flutter_test.dart';

import 'package:get_module/get_module.dart';

import 'module/test_module.dart';

void main() {
  group('Get Module', () {
    test('runs without exception', () {
      GetModuleLoader([
        TestModule(),
      ]);
    });

    test('auto run and run only once', () {
      var module = TestModule();

      GetModuleLoader([
        module,
      ], autoStart: false);

      expect(module.installed, false);
      expect(module.installedCount, 0);

      GetModuleLoader([
        module,
      ]);

      expect(module.installed, true);
      expect(module.installedCount, 1);
    });
  });
}
