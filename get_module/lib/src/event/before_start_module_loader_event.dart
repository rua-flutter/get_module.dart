import 'package:get_module/src/event/module_loader_event.dart';

/// BeforeStartModuleEvent
///
/// fired before the module start to initialize
class BeforeStartModuleLoaderEvent extends ModuleLoaderEvent {
  BeforeStartModuleLoaderEvent(super.module);
}