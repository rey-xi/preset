import 'package:flutter/material.dart';

abstract class PresetTheme<T extends PresetTheme<T>> //
    extends //
    ThemeExtension<T> {
  //...
  Widget wrap(Widget? child);
}
