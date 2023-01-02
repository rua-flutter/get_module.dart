import 'package:flutter_test/flutter_test.dart';

import 'package:get_modular/get_modular.dart';

import 'module/test_module.dart';

void main() {
  group('Get Modular', () {
    test('runs without exception', () {
      GetModular([
        TestModule(),
      ]);
    });

    test('auto run and run only once', () {
      var module = TestModule();

      GetModular([
        module,
      ], autoStart: false);

      expect(module.installed, false);
      expect(module.installedCount, 0);

      GetModular([
        module,
      ]);

      expect(module.installed, true);
      expect(module.installedCount, 1);
    });
  });
}
