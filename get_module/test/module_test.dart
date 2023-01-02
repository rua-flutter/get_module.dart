import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_module/get_module.dart';
import 'package:get_module/src/module/callback_module.dart';
import 'package:get_module/src/module/run_app_module.dart';

import 'module/test_module.dart';

void main() {
  group('module', () {
    test('all scope', () {
      // given
      var module = TestModule();

      GetModular([
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
      GetModular([
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
      GetModular([
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
      GetModular([
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
      GetModular([
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
      GetModular([
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
        await GetModular(
          [
            module,
          ],
          autoStart: false,
        ).run();
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
        await GetModular(
          [
            module,
          ],
          autoStart: false,
        ).run();
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
        await GetModular(
          [
            module.retryOnError,
          ],
          autoStart: false,
        ).run();
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
      await GetModular(
        [
          RunAppModule(const FittedBox()),
        ],
        autoStart: false,
      ).run();

      // then
      expect(eventFired, true);
    });
  });
}
