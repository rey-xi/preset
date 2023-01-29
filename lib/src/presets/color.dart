import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

import '../core/preset_value.dart';

class ColorPreset extends ValuePreset<ColorPreset> {
  //...Constants
  static const internal = ColorPreset(
    foreground: Color(0xFF6B6266),
    background: Color(0xffe1dacb),
    primary: Color(0xFF887384),
    secondary: Color(0xffec712d),
    ascent: Color(0xffe7cfae),
    success: Color(0xff499f51),
    error: Color(0xffda7673),
    warning: Color(0xffe5ad71),
    tint: Color(0x1df5ede2),
    shade: Color(0x1d75503d),
  );

  //...Fields
  final Color background, foreground;
  final Color primary, secondary, ascent;
  final Color success, error, warning;
  final Color shade, tint;

  const ColorPreset({
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
  });

  factory ColorPreset.of(BuildContext context) {
    //...
    return ValuePreset.of<ColorPreset>(context) ?? internal;
  }

  factory ColorPreset.parse(String source) {
    //...
    final data = ValuePreset.parse<ColorPreset>(source);
    return ColorPreset(
      foreground: colorCodec.decode(data['foreground']) ?? internal.foreground,
      background: colorCodec.decode(data['background']) ?? internal.background,
      primary: colorCodec.decode(data['primary']) ?? internal.primary,
      secondary: colorCodec.decode(data['secondary']) ?? internal.secondary,
      ascent: colorCodec.decode(data['ascent']) ?? internal.ascent,
      success: colorCodec.decode(data['success']) ?? internal.success,
      error: colorCodec.decode(data['error']) ?? internal.error,
      warning: colorCodec.decode(data['warning']) ?? internal.warning,
      tint: colorCodec.decode(data['tint']) ?? internal.tint,
      shade: colorCodec.decode(data['shade']) ?? internal.shade,
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

  @override
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'foreground': colorCodec.encode(foreground),
      'background': colorCodec.encode(background),
      'primary': colorCodec.encode(primary),
      'secondary': colorCodec.encode(secondary),
      'ascent': colorCodec.encode(ascent),
      'success': colorCodec.encode(success),
      'error': colorCodec.encode(error),
      'warning': colorCodec.encode(warning),
      'tint': colorCodec.encode(tint),
      'shade': colorCodec.encode(shade),
    };
  }
}

extension ContextColorPreset on BuildContext {
  //...Getters
  ColorPreset get colorPreset => ColorPreset.of(this);
}
