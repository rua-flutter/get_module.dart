import 'package:get/get.dart';

/// PageManager
///
/// manage pages from all modules
class PageManager {
  final routes = <GetPage>[];

  /// get all pages
  List<GetPage> getPages() {
    return routes;
  }

  /// add page to manager
  void addPage(GetPage page) {
    routes.add(page);
  }

  /// add pages to manager
  void addPages(Iterable<GetPage> pages) {
    routes.addAll(pages);
  }
}