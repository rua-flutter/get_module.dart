import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppConfig {
  List<TransitionBuilder> builders = [];

  TransitionBuilder? get builder {
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

  final routes = <GetPage>[];

  /// get all pages
  List<GetPage> get getPages {
    return routes;
  }

  /// add pages to manager
  void addPages(Iterable<GetPage> pages) {
    routes.addAll(pages);
  }
}