import 'package:flutter/material.dart';

import '../core/preset_value.dart';

class ColorPreset extends PresetValue<ColorPreset> {
  //...Constants
  static final internal = ColorPreset(
    foreground: const Color(0xFF6B6266),
    background: const Color(0xffe1dacb),
    primary: const Color(0xFF887384),
    secondary: const Color(0xffec712d),
    ascent: const Color(0xffe7cfae),
    success: const Color(0xff499f51),
    error: const Color(0xffda7673),
    warning: const Color(0xffe5ad71),
    tint: const Color(0x1df5ede2),
    shade: const Color(0x1d75503d),
  );

  //...Fields
  final Color background, foreground;
  final Color primary, secondary, ascent;
  final Color success, error, warning;
  final Color shade, tint;

  ColorPreset({
    required this.foreground,
    required this.background,
    required this.primary,
    required this.secondary,
    required this.ascent,
    required this.success,
    required this.error,
    required this.warning,
    required this.tint,
    required this.shade,
  }) : super({
          'foreground': ColorCodec().encode(foreground),
          'background': ColorCodec().encode(background),
          'primary': ColorCodec().encode(primary),
          'secondary': ColorCodec().encode(secondary),
          'ascent': ColorCodec().encode(ascent),
          'success': ColorCodec().encode(success),
          'error': ColorCodec().encode(error),
          'warning': ColorCodec().encode(warning),
          'tint': ColorCodec().encode(tint),
          'shade': ColorCodec().encode(shade),
        });

  factory ColorPreset.parse(String data) {
    //...
    return ColorPreset.from(PresetValue.parse(data));
  }

  factory ColorPreset.of(BuildContext context) {
    //...
    return ColorPreset.from(PresetValue.of(context));
  }

  factory ColorPreset.from(PresetValue<ColorPreset> obj) {
    //...
    return ColorPreset(
      foreground: ColorCodec().decode(obj['foreground']) ?? internal.foreground,
      background: ColorCodec().decode(obj['background']) ?? internal.background,
      primary: ColorCodec().decode(obj['primary']) ?? internal.primary,
      secondary: ColorCodec().decode(obj['secondary']) ?? internal.secondary,
      ascent: ColorCodec().decode(obj['ascent']) ?? internal.ascent,
      success: ColorCodec().decode(obj['success']) ?? internal.success,
      error: ColorCodec().decode(obj['error']) ?? internal.error,
      warning: ColorCodec().decode(obj['warning']) ?? internal.warning,
      tint: ColorCodec().decode(obj['tint']) ?? internal.tint,
      shade: ColorCodec().decode(obj['shade']) ?? internal.shade,
    );
  }

  //...Getters
  Color get primal {
    var hsv = HSVColor.fromColor(primary);
    hsv = hsv.withSaturation(.4).withValue(.6);
    return hsv.toColor();
  }

  Color get subtle {
    var hsv = HSVColor.fromColor(foreground);
    hsv = hsv.withSaturation(.1).withValue(.6);
    return hsv.toColor();
  }

  //...Methods
  Color primaryX(int alpha) => primary.withAlpha(alpha);

  Color primalX(int alpha) => primal.withAlpha(alpha);

  Color secondaryX(int alpha) => secondary.withAlpha(alpha);

  Color foregroundX(int alpha) => foreground.withAlpha(alpha);

  Color backgroundX(int alpha) => background.withAlpha(alpha);

  Color ascentX(int alpha) => ascent.withAlpha(alpha);

  @override
  ColorPreset copyWith({
    Color? foreground,
    Color? background,
    Color? primary,
    Color? secondary,
    Color? ascent,
    Color? success,
    Color? error,
    Color? warning,
    Color? shade,
    Color? tint,
  }) {
    //...
    return ColorPreset(
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      ascent: ascent ?? this.ascent,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      shade: shade ?? this.shade,
      tint: tint ?? this.tint,
    );
  }

  ColorPreset merge(other) {
    //...
    return ColorPreset(
      foreground: other?.foreground ?? foreground,
      background: other?.background ?? background,
      primary: other?.primary ?? primary,
      secondary: other?.secondary ?? secondary,
      ascent: other?.ascent ?? ascent,
      success: other?.success ?? success,
      error: other?.error ?? error,
      warning: other?.warning ?? warning,
      shade: other?.shade ?? shade,
      tint: other?.tint ?? tint,
    );
  }

  @override
  ColorPreset lerp(other, t) {
    //...
    if (other is! ColorPreset) return this;
    return ColorPreset(
      foreground: Color.lerp(foreground, other.foreground, t)!,
      background: Color.lerp(background, other.background, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      ascent: Color.lerp(ascent, other.ascent, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      shade: Color.lerp(shade, other.shade, t)!,
      tint: Color.lerp(tint, other.tint, t)!,
    );
  }
}
