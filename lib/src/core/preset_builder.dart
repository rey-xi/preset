import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

/// ## Preset Builder
/// Preset builder instances can be assigned to
/// [MaterialApp.builder] of the conventional material
/// app: If making use of the conventional Material app
/// is important, making use of this method can come in
/// handy.
///
/// ```dart
/// MaterialApp(
///   builder: PresetBuilder(
///     preset: {
///         ColorPreset.internal,
///         GlyphPreset.redmond,
//       },
///     implementation: implementation,
///   ),
/// );
/// ```
class PresetBuilder {
  //...Fields
  /// Set of default preset values this builder will
  /// pass down to its children via context.. Defined
  /// preset values serve as fallback during used by
  /// [adoption].
  final Set<PresetValue> presets;

  /// Implement preset values into the conventional
  /// material theme data. The default implementation
  /// is used if this argument is omitted.
  final PresetAdoption? adoption;

  /// Works exactly as [MaterialApp.builder]. You can
  /// implement preset values manually from here as
  /// the given context has already been logged with
  /// [presets]. See [MaterialApp.builder]
  final BuildCallback? builder;

  const PresetBuilder({
    this.presets = const {},
    this.adoption,
    this.builder,
  });

  //...Getters
  /// Gives class access to behave like [BuildCallback]
  /// which gives it permission to be assigned to
  /// [MaterialApp.builder]
  /// ```dart
  /// ie. Widget Function(BuildContext, Widget)
  /// ```
  Widget call(BuildContext context, Widget? child) {
    //...
    impl(context) => const PresetAdapter();
    final preset = Preset(
      presets: presets,
      child: Builder(
        builder: (context) {
          final implementation = adoption ?? impl;
          return implementation(context).copyWith(child: child);
        },
      ),
    );
    return (builder ?? (c, child) => child)(context, preset);
  }
}

/// Just a definition to the kinda function passed to
/// [MaterialApp.builder]. This is the function passed
/// to [PresetApp.builder] and [PresetBuilder.builder]
///
/// ```dart
/// PresetBuilder(
///   builder: (context, child) => child;
/// );
/// ```
typedef BuildCallback = Widget //...Function
    Function(BuildContext context, Widget child);
