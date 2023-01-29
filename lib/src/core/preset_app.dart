import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

class PresetApp extends MaterialApp {
  //...Fields
  final Iterable<ValuePreset> presets;
  final Iterable<ThemeExtension> extensions;
  final ThemeData? distribution;

  PresetApp({
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.title = '',
    super.home,
    super.routes = const <String, WidgetBuilder>{},
    super.initialRoute,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.navigatorObservers = const <NavigatorObserver>[],
    super.onGenerateTitle,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = true,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    super.scrollBehavior,
    super.useInheritedMediaQuery = false,
    this.presets = const {},
    this.extensions = const {},
    this.distribution,
  }) : super(
          builder: (context, child) {
            return Preset(
              presets: presets,
              extensions: extensions,
              distribution: distribution,
              child: child,
            );
          },
        );
}
