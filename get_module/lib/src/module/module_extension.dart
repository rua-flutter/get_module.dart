import 'package:get_module/get_module.dart';

extension ModuleExtension on Module {
  Module get allScope {
    scope = Scope.all;
    return this;
  }

  Module get debugOnly {
    scope = Scope.debug;
    return this;
  }

  Module get productionOnly {
    scope = Scope.production;
    return this;
  }

  Module get silenceOnError {
    errorHandle = ErrorHandle.silence;
    return this;
  }

  Module get throwsOnError {
    errorHandle = ErrorHandle.throws;
    return this;
  }

  Module get retryOnError {
    errorHandle = ErrorHandle.retry;
    return this;
  }

  Module dependsOn(List<Type> depends) {
    dependencies.addAll(depends);
    return this;
  }
}