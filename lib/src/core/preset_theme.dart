import 'package:flutter/material.dart';

abstract class PresetTheme<T extends PresetTheme<T>> //
    extends ThemeExtension<T> {
  //...Methods
  T copy(PresetTheme<T> other);

  Widget build(Widget child);
}
