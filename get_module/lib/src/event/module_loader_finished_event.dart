import 'package:get_module/src/event/module_loader_event.dart';

/// ModuleLoaderFinishedEvent
///
/// fired after the module completely finished
class ModuleLoaderFinishedEvent extends ModuleLoaderEvent {
  ModuleLoaderFinishedEvent(super.module);
}
