import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

import 'preset_builder.dart';

/// ## Preset App
/// The most basic way to implement the preset library
/// in your app. PresetApp is a direct subclass of the
/// conventional [MaterialApp] with additional argument
/// to assign default presets and implementation
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///    return PresetApp(
///       title: 'Preset App',
///       home: const PresetHome(),
///       preset: {
///         ColorPreset.internal,
///         GlyphPreset.redmond,
///       }
///    );
/// }
/// ```
class PresetApp extends MaterialApp {
  //...Fields
  /// Set of default preset values the app runs with.
  /// Defined preset values serve as fallback during
  /// used by implementations.
  final Set<PresetValue> presets;

  /// Implement preset values into the conventional
  /// material theme data. The default implementation
  /// is used if this argument is omitted.
  final PresetAdoption? adoption;

  PresetApp({
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.title = 'Preset App',
    super.navigatorObservers = const [],
    super.routes = const {},
    super.home,
    super.initialRoute,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.onGenerateTitle,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = false,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    super.scrollBehavior = const CupertinoScrollBehavior(),
    super.useInheritedMediaQuery = false,
    this.presets = const {},
    this.adoption,

    /// Works exactly as [MaterialApp.builder]. You can
    /// implement preset values manually from here as
    /// the given context has already been logged with
    /// [presets]. See [MaterialApp.builder]
    BuildCallback? builder,
  }) : super(
          builder: PresetBuilder(
            presets: presets,
            builder: builder, // extra
            adoption: adoption,
          ),
        );
}
