import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_event_bus/get_event_bus.dart';
import 'package:get_module/get_module.dart';

/// GetMaterialAppModule
///
/// Module for [GetMaterialApp]
class GetCupertinoAppModule extends Module {
  final Key? key;

  final GlobalKey<NavigatorState>? navigatorKey;

  final Widget? home;
  final Map<String, WidgetBuilder> routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final CustomTransition? customTransition;
  final Color? color;
  final Map<String, Map<String, String>>? translationsKeys;
  final Translations? translations;
  final TextDirection? textDirection;
  final Locale? locale;
  final Locale? fallbackLocale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Map<Type, Action<Intent>>? actions;
  final Function(Routing?)? routingCallback;
  final Transition? defaultTransition;
  final bool? opaqueRoute;
  final VoidCallback? onInit;
  final VoidCallback? onReady;
  final VoidCallback? onDispose;
  final bool? enableLog;
  final LogWriterCallback? logWriterCallback;
  final bool? popGesture;
  final SmartManagement smartManagement;
  final Bindings? initialBinding;
  final Duration? transitionDuration;
  final bool? defaultGlobalState;
  final List<GetPage>? getPages;
  final GetPage? unknownRoute;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final CupertinoThemeData? theme;
  final bool useInheritedMediaQuery;

  GetCupertinoAppModule({
    this.key,
    this.theme,
    this.navigatorKey,
    this.home,
    Map<String, Widget Function(BuildContext)> this.routes =
        const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    List<NavigatorObserver> this.navigatorObservers =
        const <NavigatorObserver>[],
    this.builder,
    this.translationsKeys,
    this.translations,
    this.textDirection,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.customTransition,
    this.onInit,
    this.onDispose,
    this.locale,
    this.fallbackLocale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.smartManagement = SmartManagement.full,
    this.initialBinding,
    this.useInheritedMediaQuery = false,
    this.unknownRoute,
    this.routingCallback,
    this.defaultTransition,
    this.onReady,
    this.getPages,
    this.opaqueRoute,
    this.enableLog = kDebugMode,
    this.logWriterCallback,
    this.popGesture,
    this.transitionDuration,
    this.defaultGlobalState,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
    // other
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null;

  @override
  void install() {
    final moduleConfig = Get.moduleConfig;
    final hasBuilder = builder != null || moduleConfig.builders.isNotEmpty;

    Widget mergedBuilder(BuildContext context, Widget? child) {
      Widget? widget = child;

      if (builder != null) {
        widget = builder!(context, widget);
      }

      for (final func in moduleConfig.builders) {
        widget = func(context, widget);
      }

      return widget!;
    }

    runApp(GetCupertinoApp(
      key: key,
      theme: theme,
      navigatorKey: navigatorKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: hasBuilder ? mergedBuilder : null,
      translationsKeys: translationsKeys,
      translations: translations,
      textDirection: textDirection,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      customTransition: customTransition,
      onInit: onInit,
      onDispose: onDispose,
      locale: locale,
      fallbackLocale: fallbackLocale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      smartManagement: smartManagement,
      initialBinding: initialBinding,
      useInheritedMediaQuery: useInheritedMediaQuery,
      unknownRoute: unknownRoute,
      routingCallback: routingCallback,
      defaultTransition: defaultTransition,
      onReady: onReady,
      getPages: getPages ?? [],
      opaqueRoute: opaqueRoute,
      enableLog: enableLog,
      logWriterCallback: logWriterCallback,
      popGesture: popGesture,
      transitionDuration: transitionDuration,
      defaultGlobalState: defaultGlobalState,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      actions: actions,
    ));

    Get.bus.fire(AppStartedEvent(moduleLoader));
  }

  @override
  bool satisfy() {
    return moduleLoader.pendingModules.whereType<GetModule>().isEmpty &&
        moduleLoader.modules.whereType<GetModule>().isEmpty;
  }
}
