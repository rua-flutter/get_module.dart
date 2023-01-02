import 'package:get_module/src/event/module_loader_event.dart';

/// AfterStartModuleLoaderEvent
///
/// fired after the modular completely finished
class AfterStartModuleLoaderEvent extends ModuleLoaderEvent {
  AfterStartModuleLoaderEvent(super.module);
}