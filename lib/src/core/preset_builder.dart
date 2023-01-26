import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

abstract class PresetBuilder {
  //...Getters
  Iterable<PresetValue> get presets;

  Iterable<ThemeExtension> get themes;

  Widget call(BuildContext context, Widget? child) {
    return Preset(
      presets: presets,
      themes: themes,
      child: child,
    );
  }
}
