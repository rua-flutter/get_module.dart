import 'package:get_module/src/event/module_loader_event.dart';

/// ModuleLoaderStartedEvent
///
/// fired before the module start to initialize
class ModuleLoaderStartedEvent extends ModuleLoaderEvent {
  ModuleLoaderStartedEvent(super.module);
}
