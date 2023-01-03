import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_module/get_module.dart';

import 'module/test_module.dart';

void main() {
  group('module', () {
    test('all scope', () {
      // given
      var module = TestModule();

      GetModuleLoader([
        module,
      ]);

      // then
      expect(module.installed, true);
      expect(module.installedCount, 1);
    });

    test('Scope.debug in debug mode', () {
      // given
      var module = TestModule();

      // when
      GetModuleLoader([
        module.debugOnly,
      ]);

      // then
      expect(module.installed, true);
      expect(module.installedCount, 1);
    });

    test('Scope.production in debug mode', () {
      // given
      var module = TestModule();

      // when
      GetModuleLoader([
        module.productionOnly,
      ]);

      // then
      expect(module.installed, false);
      expect(module.installedCount, 0);
    });

    test('Scope.debug in production mode', () {
      // given
      var module = TestModule()..testingProductionMode = true;

      // when
      GetModuleLoader([
        module.debugOnly,
      ]);

      // then
      expect(module.installed, false);
      expect(module.installedCount, 0);
    });

    test('Scope.production in production mode', () {
      // given
      var module = TestModule()..testingProductionMode = true;

      // when
      GetModuleLoader([
        module.productionOnly,
      ]);

      // then
      expect(module.installed, true);
      expect(module.installedCount, 1);
    });

    test('ErrorHandle.silence', () {
      // given
      var module = CallbackModule(() {
        throw Exception();
      });

      // when
      GetModuleLoader([
        module.silenceOnError,
      ]);

      // then
      // no error
    });

    test('ErrorHandle.throwOnError', () async {
      // given
      var module = CallbackModule(() {
        throw Exception();
      });

      // when
      try {
        final loader = GetModuleLoader(
          [
            module,
          ],
          autoStart: false,
        )..run();
        await Future.wait(loader.pendingExecutions);
        // should never called
        assert(false);
      } catch (e) {
        // then
        expect(e, isA<Exception>());
      }
    });

    test('ErrorHandle.ignore', () async {
      // given
      var module = CallbackModule(() {
        throw Exception();
      });

      // when
      try {
        final loader = GetModuleLoader(
          [
            module,
          ],
          autoStart: false,
        )..run();
        await Future.wait(loader.pendingExecutions);
        // should never called
        assert(false);
      } catch (e) {
        // then
        expect(e, isA<Exception>());
      }
    });

    test('ErrorHandle.retry', () async {
      // given
      var module = TestErrorModule();

      // when
      try {
        final loader = GetModuleLoader(
          [
            module.retryOnError,
          ],
          autoStart: false,
        )..run();
        await Future.wait(loader.pendingExecutions);
        // should never called
        assert(false);
      } catch (e) {
        // then
        expect(e, isA<Exception>());
        expect(module.installedCount, 4);
      }
    });

    test('RunAppModule', () async {
      // given
      var eventFired = false;

      Get.bus.streamController = StreamController(sync: true);
      Get.bus.on<AppStartedEvent>((event) {
        eventFired = true;
      });

      // when
      final loader = GetModuleLoader(
        [
          GetMaterialAppModule(),
        ],
        autoStart: false,
      )..run();
      await Future.wait(loader.pendingExecutions);

      // then
      expect(eventFired, true);
    });
  });
}
