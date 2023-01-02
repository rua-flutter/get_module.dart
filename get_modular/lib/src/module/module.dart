import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get_modular/get_modular.dart';

/// module scope
enum Scope {
  // run module at any mode.
  all,
  // run module only at debug mode.
  debug,
  // run module only at production mode and profile mode.
  production,
}

/// error handling method
enum ErrorHandle {
  // ignore error and log on console in debug mode.
  ignore,
  // terminate module installation, and hand it over to GetModular.
  terminate,
  // retry until success
  retryUntilSuccess,
}

/// Module
abstract class Module {
  late Modular modular;

  @protected
  @visibleForTesting
  Scope scope = Scope.all;

  @protected
  @visibleForTesting
  ErrorHandle errorHandle = ErrorHandle.ignore;

  @protected
  @visibleForTesting
  int failCount = 0;

  List<Type> dependencies = [];

  FutureOr<void> install();

  Future<void> run() async {
    if (kDebugMode && scope == Scope.production) {
      log('$runtimeType module is production only, so ignored', name: 'Get Modular');
      return;
    }

    if (!kDebugMode && scope == Scope.debug) {
      return;
    }

    try {
      await install();
    } catch (e) {
      failCount++;
      switch (errorHandle) {
        case ErrorHandle.ignore:
          break;
        case ErrorHandle.terminate:
          rethrow;
        case ErrorHandle.retryUntilSuccess:
          await Future.delayed(const Duration(milliseconds: 250));
          await run();
          break;
      }
    }
  }

  Module get debugOnly {
    scope = Scope.debug;
    return this;
  }

  Module get productionOnly {
    scope = Scope.production;
    return this;
  }

  Module get terminateOnError {
    errorHandle = ErrorHandle.terminate;
    return this;
  }

  Module get retryUntilSuccess {
    errorHandle = ErrorHandle.retryUntilSuccess;
    return this;
  }
}
