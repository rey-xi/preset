import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

abstract class PresetBuilder {
  //...Fields
  const PresetBuilder();

  //...Getters
  Iterable<ValuePreset> get presets;

  Iterable<ThemeExtension> get themes;

  Widget call(BuildContext context, Widget? child) {
    return Preset(
      presets: presets,
      extensions: themes,
      child: child,
    );
  }
}
