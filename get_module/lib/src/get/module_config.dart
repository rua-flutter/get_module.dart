import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// ModuleConfig
class ModuleConfig {
  List<TransitionBuilder> builders = [];

  TransitionBuilder? get getBuilder {
    if (builders.isNotEmpty) {
      return _builder;
    }

    return null;
  }

  Widget _builder(BuildContext context, Widget? child) {
    Widget? widget = child;

    for (final func in builders) {
      widget = func(context, widget);
    }

    return widget!;
  }

  final pages = <GetPage>[];

  /// get all pages
  List<GetPage> get getPages {
    return pages;
  }

  /// add pages to manager
  void addPages(Iterable<GetPage> list) {
    pages.addAll(list);
  }
}

extension GetModuleConfigExtension on GetInterface {
  static final _moduleConfig = ModuleConfig();

  ModuleConfig get moduleConfig => _moduleConfig;
}
