import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

abstract class PresetBuilder extends StatelessWidget implements Preset {
  //...Fields
  @override
  final Widget? child;

  const PresetBuilder({super.key, this.child});

  //...Getters
  @override
  Iterable<PresetValue> get presets;

  @override
  Iterable<ThemeExtension> get themes;

  @override
  Widget build(BuildContext context) {
    return Preset(
      presets: presets,
      themes: themes,
      child: child,
    );
  }

  Widget call(BuildContext context, Widget? child) {
    return Preset(
      presets: presets,
      themes: themes,
      child: child,
    );
  }
}
