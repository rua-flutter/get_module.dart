import 'package:get_module/src/event/module_loader_event.dart';

/// BeforeStartModularEvent
///
/// fired before the modular start to initialize
class BeforeStartModularEvent extends ModuleLoaderEvent {
  BeforeStartModularEvent(super.module);
}