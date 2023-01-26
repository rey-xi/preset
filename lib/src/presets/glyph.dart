import 'package:flutter/material.dart';

import '../core/preset_value.dart';
import 'color.dart';

class GlyphPreset extends PresetValue<GlyphPreset> {
  //...constants
  static final redmond = GlyphPreset(
    //...Redmond
    normal: Typography.blackRedmond,
    abnormal: Typography.blackRedmond,
    primary: Typography.blackRedmond,
    secondary: Typography.blackRedmond,
    ascent: Typography.blackRedmond,
    error: Typography.blackRedmond,
    warning: Typography.blackRedmond,
  );

  //...Redwood City
  static final redwoodCity = GlyphPreset(
    normal: Typography.blackRedwoodCity,
    abnormal: Typography.blackRedwoodCity,
    primary: Typography.blackRedwoodCity,
    secondary: Typography.blackRedwoodCity,
    ascent: Typography.blackRedwoodCity,
    error: Typography.blackRedwoodCity,
    warning: Typography.blackRedwoodCity,
  );

  //...Helsinki
  static final helsinki = GlyphPreset(
    normal: Typography.blackHelsinki,
    abnormal: Typography.blackHelsinki,
    primary: Typography.blackHelsinki,
    secondary: Typography.blackHelsinki,
    ascent: Typography.blackHelsinki,
    error: Typography.blackHelsinki,
    warning: Typography.blackHelsinki,
  );

  //...Mountain View
  static final mountainView = GlyphPreset(
    normal: Typography.blackMountainView,
    abnormal: Typography.blackMountainView,
    primary: Typography.blackMountainView,
    secondary: Typography.blackMountainView,
    ascent: Typography.blackMountainView,
    error: Typography.blackMountainView,
    warning: Typography.blackMountainView,
  );

  //...Cupertino
  static final cupertino = GlyphPreset(
    normal: Typography.blackCupertino,
    abnormal: Typography.blackCupertino,
    primary: Typography.blackCupertino,
    secondary: Typography.blackCupertino,
    ascent: Typography.blackCupertino,
    error: Typography.blackCupertino,
    warning: Typography.blackCupertino,
  );

  //...Fields
  final TextTheme primary, secondary, normal;
  final TextTheme abnormal, ascent, error, warning;

  GlyphPreset({
    required this.primary,
    required this.secondary,
    required this.normal,
    required this.abnormal,
    required this.ascent,
    required this.error,
    required this.warning,
  }) : super({
          'primary': TextThemeCodec().encode(primary),
          'secondary': TextThemeCodec().encode(secondary),
          'normal': TextThemeCodec().encode(normal),
          'abnormal': TextThemeCodec().encode(abnormal),
          'ascent': TextThemeCodec().encode(ascent),
          'error': TextThemeCodec().encode(error),
          'warning': TextThemeCodec().encode(warning),
        });

  factory GlyphPreset.of(BuildContext context) {
    //...
    final thx = Theme.of(context);
    final col = ColorPreset.of(context);
    //...Default to Typeface from Palette
    final x = GlyphPreset.from(PresetValue.of(context));
    return x.copyWith(parent: thx.textTheme, palette: col);
  }

  factory GlyphPreset.parse(String data) {
    //...
    return GlyphPreset.from(PresetValue.parse(data));
  }

  factory GlyphPreset.from(PresetValue<GlyphPreset> preset) {
    //...Default to Typeface from Palette
    return GlyphPreset(
      primary: TextThemeCodec().decode(preset['primary']),
      secondary: TextThemeCodec().decode(preset['secondary']),
      normal: TextThemeCodec().decode(preset['normal']),
      abnormal: TextThemeCodec().decode(preset['abnormal']),
      ascent: TextThemeCodec().decode(preset['ascent']),
      error: TextThemeCodec().decode(preset['error']),
      warning: TextThemeCodec().decode(preset['warning']),
    );
  }

  //...Getters
  TextTheme get primal {
    final hsv = HSVColor.fromColor(primary.bodySmall!.color!);
    final color = hsv.withSaturation(.4).withValue(.6).toColor();
    return primary.apply(
      displayColor: color,
      bodyColor: color,
    );
  }

  TextTheme get subtle {
    final hsv = HSVColor.fromColor(normal.bodySmall!.color!);
    final color = hsv.withSaturation(.1).withValue(.6).toColor();
    return primary.apply(
      displayColor: color,
      bodyColor: color,
    );
  }

  //...Methods
  GlyphPreset apply({
    ColorPreset? palette,
    TextStyle? primary,
    TextStyle? secondary,
    TextStyle? normal,
    TextStyle? abnormal,
    TextStyle? ascent,
    TextStyle? error,
    TextStyle? warning,
    TextStyle? all,
  }) {
    //...
    TextStyle merge(style, color) {
      //...
      style = style?.copyWith(colors: color);
      return style ?? TextStyle(color: color);
    }

    TextTheme apply(original, other) {
      //...
      return original.apply(
        bodyColor: other?.colors ?? all?.color,
        displayColor: other?.colors ?? all?.color,
        fontFamily: other?.fontFamily ?? all?.fontFamily,
        decoration: other?.decoration ?? all?.decoration,
        decorationColor: other?.decorationColor ?? all?.decorationColor,
        decorationStyle: other?.decorationStyle ?? all?.decorationStyle,
      );
    }

    return GlyphPreset(
      primary: apply(this.primary, merge(primary, palette?.primary)),
      secondary: apply(this.secondary, merge(secondary, palette?.secondary)),
      normal: apply(this.normal, merge(normal, palette?.foreground)),
      abnormal: apply(this.abnormal, merge(abnormal, palette?.background)),
      ascent: apply(this.ascent, merge(ascent, palette?.ascent)),
      error: apply(this.error, merge(error, palette?.error)),
      warning: apply(this.warning, merge(warning, palette?.warning)),
    );
  }

  GlyphPreset merge(GlyphPreset? other) {
    //...
    return GlyphPreset(
      primary: primary.merge(other?.primary),
      secondary: secondary.merge(other?.secondary),
      normal: normal.merge(other?.normal),
      abnormal: abnormal.merge(other?.abnormal),
      ascent: ascent.merge(other?.ascent),
      error: error.merge(other?.error),
      warning: warning.merge(other?.warning),
    );
  }

  @override
  GlyphPreset copyWith({
    ColorPreset? palette,
    TextTheme? primary,
    TextTheme? secondary,
    TextTheme? normal,
    TextTheme? abnormal,
    TextTheme? ascent,
    TextTheme? error,
    TextTheme? warning,
    TextTheme? parent,
    TextTheme? child,
  }) {
    //...
    TextTheme sudo(TextTheme theme, color, nxt) {
      var arch = (parent ?? theme).merge(theme); //...parenting
      arch = arch.apply(displayColor: color, bodyColor: color);
      return arch.merge(nxt).merge(child);
    }

    return GlyphPreset(
      primary: sudo(this.primary, palette?.primary, primary),
      secondary: sudo(this.secondary, palette?.secondary, secondary),
      normal: sudo(this.normal, palette?.foreground, normal),
      abnormal: sudo(this.abnormal, palette?.background, abnormal),
      ascent: sudo(this.ascent, palette?.ascent, ascent),
      error: sudo(this.error, palette?.error, error),
      warning: sudo(this.warning, palette?.warning, warning),
    );
  }

  @override
  GlyphPreset lerp(other, t) {
    //...
    if (other is! GlyphPreset) return this;
    return GlyphPreset(
      primary: TextTheme.lerp(primary, other.primary, t),
      secondary: TextTheme.lerp(secondary, other.secondary, t),
      normal: TextTheme.lerp(normal, other.normal, t),
      abnormal: TextTheme.lerp(abnormal, other.abnormal, t),
      ascent: TextTheme.lerp(ascent, other.ascent, t),
      error: TextTheme.lerp(error, other.error, t),
      warning: TextTheme.lerp(warning, other.warning, t),
    );
  }
}
