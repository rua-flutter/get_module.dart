import 'package:get_module/src/event/module_loader_event.dart';

/// AppStartedEvent
///
/// fired after runApp() is called
class AppStartedEvent extends ModuleLoaderEvent {
  AppStartedEvent(super.module);
}
