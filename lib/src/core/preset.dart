import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

/// ## Preset
/// The basic and core method to declare presets.
/// The values of [presets] will be passed down to
/// [child] and it's hierarchy via context.
///
/// ```dart
/// @override
/// Widget build(BuildContext context) {
///    return Preset(
///       preset: {
///         ColorPreset.internal,
///         GlyphPreset.redmond,
///       }
///       child: Container(
///          width: double.infinity,
///          ...
///       )
///    );
/// }
/// ```
class Preset extends StatefulWidget {
  //...Fields
  /// Set of default preset values the app runs with.
  /// Defined preset values serve as fallback during
  /// used by implementations.
  final Set<PresetValue> presets;

  /// Unto the next generation of widgets that is
  /// affected by this Impl implementation.
  final Widget child;

  const Preset({
    super.key,
    this.presets = const {},
    required this.child,
  });

  @override
  State<Preset> createState() => _PresetState();
}

class _PresetState extends State<Preset> {
  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    return Theme(
      data: Theme.of(context).copyWith(
        extensions: {
          ...Theme.of(context).extensions.values,
          ...widget.presets,
        },
      ),
      child: widget.child,
    );
  }
}
