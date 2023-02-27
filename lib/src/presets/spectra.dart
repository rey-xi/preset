import 'package:flutter/material.dart';
import 'package:preset/preset.dart';
import 'package:qp_xt/qp_xt.dart';

import '../core/preset_value.dart';

/// ## Spectra
/// [Color] implementation of [PresetValue].
///
/// ```dart
/// Spectra(
///   foreground: Color(0xFF6B6266),
///   background: Color(0xffe1dacb),
///   primary: Color(0xFF887384),
///   secondary: Color(0xffec712d),
///   ascent: Color(0xffe7cfae),
///   success: Color(0xff499f51),
///   error: Color(0xffda7673),
///   warning: Color(0xffe5ad71),
///   tint: Color(0x5af5ede2),
///   shade: Color(0x5a75503d),
/// );
/// ```
class Spectra extends PresetValue<Spectra> {
  //...Constants
  static const internal = Spectra(
    foreground: Color(0xFF6B6266),
    background: Color(0xffe1dacb),
    primary: Color(0xFF887384),
    secondary: Color(0xffec712d),
    ascent: Color(0xffe7cfae),
    success: Color(0xff499f51),
    error: Color(0xffda7673),
    warning: Color(0xffe5ad71),
    tint: Color(0x5af5ede2),
    shade: Color(0x5a75503d),
  );

  //...Fields
  final Color background, foreground;
  final MaterialColor? _swatch;
  final Color primary, secondary, ascent;
  final Color? _primary, _secondary, _ascent;
  final Color success, error, warning;
  final Color shade, tint;

  const Spectra({
    MaterialColor? swatch,
    required this.foreground,
    required this.background,
    required this.primary,
    required this.secondary,
    required this.ascent,
    Color? onPrimary,
    Color? onSecondary,
    Color? onAscent,
    required this.success,
    required this.error,
    required this.warning,
    required this.tint,
    required this.shade,
  })  : _swatch = swatch,
        _primary = onPrimary,
        _secondary = onSecondary,
        _ascent = onAscent;

  /// Retrieve Spectra instance form [context]. If context
  /// has no instance of Spectra in it, [Spectra.internal]
  /// is returned.
  /// ```dart
  /// const spectra = Spectra.of(context)
  /// ```
  factory Spectra.of(BuildContext context) {
    //...
    final colors = PresetValue.of<Spectra>(context);
    return colors ?? internal; // spectra fallback data
  }

  /// Retrieve Spectra instance form [source]. If [source]
  /// is not valid, [Spectra.internal] is returned.
  /// ```dart
  /// const spectra = Spectra.parse(source)
  /// ```
  factory Spectra.parse(String source) {
    //...
    final data = PresetValue.parse<Spectra>(source);
    return Spectra.fromJson(data);
  }

  /// Retrieve Spectra instance form [data]. If [data] is
  /// not valid, [Spectra.internal] is returned.
  /// ```dart
  /// const spectra = Spectra.fromJson(data)
  /// ```
  factory Spectra.fromJson(Map<String, dynamic> data) {
    //...
    return Spectra(
      swatch: Colors.primaries.elementAtOrNull(data['swatch']),
      foreground: qColor.decode(data['foreground']) ?? internal.foreground,
      background: qColor.decode(data['background']) ?? internal.background,
      //...surface
      primary: qColor.decode(data['primary']) ?? internal.primary,
      secondary: qColor.decode(data['secondary']) ?? internal.secondary,
      ascent: qColor.decode(data['ascent']) ?? internal.ascent,
      //...on surface
      onPrimary: qColor.decode(data['onPrimary']),
      onSecondary: qColor.decode(data['onSecondary']),
      onAscent: qColor.decode(data['onAscent']),
      //...extras
      success: qColor.decode(data['success']) ?? internal.success,
      error: qColor.decode(data['error']) ?? internal.error,
      warning: qColor.decode(data['warning']) ?? internal.warning,
      tint: qColor.decode(data['tint']) ?? internal.tint,
      shade: qColor.decode(data['shade']) ?? internal.shade,
    );
  }

  //...Getters
  MaterialColor get swatch {
    return _swatch ?? Colors.primaries.closestTo(primary);
  }

  Color get onPrimary {
    final colors = [foreground, background];
    return _primary ?? colors.farthestFrom(primary);
  }

  Color get onSecondary {
    final colors = [foreground, background];
    return _secondary ?? colors.farthestFrom(secondary);
  }

  Color get onAscent {
    final colors = [foreground, background];
    return _ascent ?? colors.farthestFrom(ascent);
  }

  Color get onSuccess {
    final colors = [foreground, background];
    return colors.farthestFrom(success);
  }

  Color get onError {
    final colors = [foreground, background];
    return colors.farthestFrom(error);
  }

  Color get onWarning {
    final colors = [foreground, background];
    return colors.farthestFrom(warning);
  }

  Color get primal {
    var hsv = HSVColor.fromColor(primary);
    hsv = hsv.withSaturation(.4).withValue(.6);
    return hsv.toColor();
  }

  Color get onPrimal {
    final colors = [foreground, background];
    return _primary ?? colors.farthestFrom(primal);
  }

  Color get subtle {
    var hsv = HSVColor.fromColor(foreground);
    hsv = hsv.withSaturation(.1).withValue(.6);
    return hsv.toColor();
  }

  Color get onSubtle {
    final colors = [foreground, background];
    return colors.farthestFrom(subtle);
  }

  //...Methods
  @override
  Spectra copyWith({
    MaterialColor? swatch,
    Color? foreground,
    Color? background,
    //...surface
    Color? primary,
    Color? secondary,
    Color? ascent,
    //...on surface
    Color? onPrimary,
    Color? onSecondary,
    Color? onAscent,
    //...extras
    Color? success,
    Color? error,
    Color? warning,
    Color? shade,
    Color? tint,
  }) {
    //...
    return Spectra(
      swatch: swatch ?? _swatch,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      //...surface
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      ascent: ascent ?? this.ascent,
      //...on surface
      onPrimary: onPrimary ?? _primary,
      onSecondary: onSecondary ?? _secondary,
      onAscent: onAscent ?? _ascent,
      //...extras
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      shade: shade ?? this.shade,
      tint: tint ?? this.tint,
    );
  }

  @override
  Spectra merge(other) {
    //...
    return Spectra(
      swatch: other?._swatch ?? _swatch,
      foreground: other?.foreground ?? foreground,
      background: other?.background ?? background,
      //...surface
      primary: other?.primary ?? primary,
      secondary: other?.secondary ?? secondary,
      ascent: other?.ascent ?? ascent,
      //...on surface
      onPrimary: other?._primary ?? _primary,
      onSecondary: other?._secondary ?? _secondary,
      onAscent: other?._ascent ?? _ascent,
      //...extras
      success: other?.success ?? success,
      error: other?.error ?? error,
      warning: other?.warning ?? warning,
      shade: other?.shade ?? shade,
      tint: other?.tint ?? tint,
    );
  }

  @override
  Spectra lerp(other, t) {
    //...
    if (other is! Spectra) return this;
    return Spectra(
      swatch: t >= .5 ? other._swatch : _swatch,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      background: Color.lerp(background, other.background, t)!,
      //...surface
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      ascent: Color.lerp(ascent, other.ascent, t)!,
      //...on surface
      onPrimary: Color.lerp(_primary, other._primary, t)!,
      onSecondary: Color.lerp(_secondary, other._secondary, t)!,
      onAscent: Color.lerp(_ascent, other._ascent, t)!,
      //...extras
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
      'swatch': Colors.primaries.indexOf(swatch),
      'foreground': qColor.encode(foreground),
      'background': qColor.encode(background),
      //...surface
      'primary': qColor.encode(primary),
      'secondary': qColor.encode(secondary),
      'ascent': qColor.encode(ascent),
      //...on surface
      'onPrimary': qColor.encode(onPrimary),
      'onSecondary': qColor.encode(onSecondary),
      'onAscent': qColor.encode(onAscent),
      //...extras
      'success': qColor.encode(success),
      'error': qColor.encode(error),
      'warning': qColor.encode(warning),
      'tint': qColor.encode(tint),
      'shade': qColor.encode(shade),
    };
  }
}
