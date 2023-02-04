import 'package:flutter/material.dart';
import 'package:preset/preset.dart';
import 'package:qp_xt/qp_xt.dart';

/// ## Glyph Preset
/// [Typography] implementation of [PresetValue].
/// ```dart
/// GlyphPreset(
///   alt: Typography.blackRedmond,
///   normal: Typography.blackRedmond,
///   primary: Typography.blackRedmond,
///   secondary: Typography.blackRedmond,
///   ascent: Typography.blackRedmond,
///   success: Typography.blackRedmond,
///   error: Typography.blackRedmond,
///   warning: Typography.blackRedmond,
/// );
/// ```
class GlyphPreset extends PresetValue<GlyphPreset> {
  //...constants
  static const redmond = GlyphPreset(
    //...Redmond
    foreground: Typography.blackRedmond,
    background: Typography.blackRedmond,
    primary: Typography.blackRedmond,
    secondary: Typography.blackRedmond,
    ascent: Typography.blackRedmond,
    success: Typography.blackRedmond,
    error: Typography.blackRedmond,
    warning: Typography.blackRedmond,
  );

  //...Redwood City
  static const redwoodCity = GlyphPreset(
    foreground: Typography.blackRedwoodCity,
    background: Typography.blackRedwoodCity,
    primary: Typography.blackRedwoodCity,
    secondary: Typography.blackRedwoodCity,
    ascent: Typography.blackRedwoodCity,
    success: Typography.blackRedwoodCity,
    error: Typography.blackRedwoodCity,
    warning: Typography.blackRedwoodCity,
  );

  //...Helsinki
  static const helsinki = GlyphPreset(
    foreground: Typography.blackHelsinki,
    background: Typography.blackHelsinki,
    primary: Typography.blackHelsinki,
    secondary: Typography.blackHelsinki,
    ascent: Typography.blackHelsinki,
    success: Typography.blackHelsinki,
    error: Typography.blackHelsinki,
    warning: Typography.blackHelsinki,
  );

  //...Mountain View
  static const mountainView = GlyphPreset(
    foreground: Typography.blackMountainView,
    background: Typography.blackMountainView,
    primary: Typography.blackMountainView,
    secondary: Typography.blackMountainView,
    ascent: Typography.blackMountainView,
    success: Typography.blackMountainView,
    error: Typography.blackMountainView,
    warning: Typography.blackMountainView,
  );

  //...Cupertino
  static const cupertino = GlyphPreset(
    foreground: Typography.blackCupertino,
    background: Typography.blackCupertino,
    primary: Typography.blackCupertino,
    secondary: Typography.blackCupertino,
    ascent: Typography.blackCupertino,
    success: Typography.blackCupertino,
    error: Typography.blackCupertino,
    warning: Typography.blackCupertino,
  );

  //...Fields
  final TextTheme background, foreground;
  final TextTheme primary, secondary, ascent;
  final TextTheme? _primary, _secondary, _ascent;
  final TextTheme success, error, warning;

  const GlyphPreset({
    required this.background,
    required this.foreground,
    required this.primary,
    required this.secondary,
    required this.ascent,
    TextTheme? onPrimary,
    TextTheme? onSecondary,
    TextTheme? onAscent,
    required this.success,
    required this.error,
    required this.warning,
  })  : _primary = onPrimary,
        _secondary = onSecondary,
        _ascent = onAscent;

  /// Retrieve GlyphPreset instance form [context].
  /// If context has no instance of GlyphPreset in it,
  /// [GlyphPreset.redmond] is returned.
  factory GlyphPreset.of(BuildContext context) {
    //...
    final thx = Theme.of(context);
    final colors = ColorPreset.of(context);
    //...Default to Typeface from Palette
    final x = PresetValue.of<GlyphPreset>(context) ?? redmond;
    return x.copyWith(parent: thx.textTheme, palette: colors);
  }

  /// Retrieve GlyphPreset instance form [source].
  /// If [source] is not valid, [GlyphPreset.redmond]
  /// is returned.
  factory GlyphPreset.parse(String source) {
    //...
    final data = PresetValue.parse<GlyphPreset>(source);
    return GlyphPreset.fromJson(data);
  }

  /// Retrieve GlyphPreset instance form [data].
  /// If [data] is not valid, [GlyphPreset.redmond]
  /// is returned.
  factory GlyphPreset.fromJson(Map<String, dynamic> data) {
    //...
    return GlyphPreset(
      background: qTextTheme.decode(data['background']) ?? redmond.background,
      foreground: qTextTheme.decode(data['foreground']) ?? redmond.foreground,
      //...surface
      primary: qTextTheme.decode(data['primary']) ?? redmond.primary,
      secondary: qTextTheme.decode(data['secondary']) ?? redmond.secondary,
      ascent: qTextTheme.decode(data['ascent']) ?? redmond.ascent,
      //...on surface
      onPrimary: qTextTheme.decode(data['onPrimary']) ?? redmond._primary,
      onSecondary: qTextTheme.decode(data['onSecondary']) ?? redmond._secondary,
      onAscent: qTextTheme.decode(data['onAscent']) ?? redmond._ascent,
      //...extras
      success: qTextTheme.decode(data['success']) ?? redmond.success,
      error: qTextTheme.decode(data['error']) ?? redmond.error,
      warning: qTextTheme.decode(data['warning']) ?? redmond.error,
    );
  }

  //...Getters
  TextTheme get onPrimary {
    final primaryQ = primary.bodyMedium?.color?.isLight;
    final foreQ = foreground.bodyMedium?.color?.isDark;
    if (primaryQ == foreQ) return _primary ?? foreground;
    return _primary ?? background;
  }

  TextTheme get onSecondary {
    final secondaryQ = secondary.bodyMedium?.color?.isLight;
    final foreQ = foreground.bodyMedium?.color?.isDark;
    if (secondaryQ == foreQ) return _secondary ?? foreground;
    return _secondary ?? background;
  }

  TextTheme get onAscent {
    final ascentQ = ascent.bodyMedium?.color?.isLight;
    final foreQ = foreground.bodyMedium?.color?.isDark;
    if (ascentQ == foreQ) return _ascent ?? foreground;
    return _ascent ?? background;
  }

  TextTheme get primal {
    final hsv = HSVColor.fromColor(primary.bodySmall!.color!);
    final color = hsv.withSaturation(.4).withValue(.6).toColor();
    return primary.apply(
      displayColor: color,
      bodyColor: color,
    );
  }

  TextTheme get subtle {
    final hsv = HSVColor.fromColor(foreground.bodySmall!.color!);
    final color = hsv.withSaturation(.1).withValue(.6).toColor();
    return primary.apply(
      displayColor: color,
      bodyColor: color,
    );
  }

  //...Methods
  GlyphPreset apply({
    ColorPreset? palette,
    TextStyle? background,
    TextStyle? foreground,
    //...surface
    TextStyle? primary,
    TextStyle? secondary,
    TextStyle? ascent,
    //...on surface
    TextStyle? onPrimary,
    TextStyle? onSecondary,
    TextStyle? onAscent,
    //...extras
    TextStyle? success,
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
      background: apply(this.background, merge(background, palette?.background)),
      foreground: apply(this.foreground, merge(foreground, palette?.foreground)),
      //...surface
      primary: apply(this.primary, merge(primary, palette?.primary)),
      secondary: apply(this.secondary, merge(secondary, palette?.secondary)),
      ascent: apply(this.ascent, merge(ascent, palette?.ascent)),
      //...on surface
      onPrimary: apply(_primary, merge(onPrimary, palette?.onPrimary)),
      onSecondary: apply(_secondary, merge(onSecondary, palette?.onSecondary)),
      onAscent: apply(_ascent, merge(onAscent, palette?.onAscent)),
      //...extras
      success: apply(this.success, merge(success, palette?.success)),
      error: apply(this.error, merge(error, palette?.error)),
      warning: apply(this.warning, merge(warning, palette?.warning)),
    );
  }

  @override
  GlyphPreset merge(other) {
    //...
    return GlyphPreset(
      background: background.merge(other?.background),
      foreground: foreground.merge(other?.foreground),
      //...surface
      primary: primary.merge(other?.primary),
      secondary: secondary.merge(other?.secondary),
      ascent: ascent.merge(other?.ascent),
      //...on surface
      onPrimary: _primary?.merge(other?._primary),
      onSecondary: _secondary?.merge(other?._secondary),
      onAscent: _ascent?.merge(other?._ascent),
      //...extras
      success: success.merge(other?.success),
      error: error.merge(other?.error),
      warning: warning.merge(other?.warning),
    );
  }

  @override
  GlyphPreset copyWith({
    ColorPreset? palette,
    TextTheme? background,
    TextTheme? foreground,
    //...surface
    TextTheme? primary,
    TextTheme? secondary,
    TextTheme? ascent,
    //...on surface
    TextTheme? onPrimary,
    TextTheme? onSecondary,
    TextTheme? onAscent,
    //...extras
    TextTheme? success,
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
      background: sudo(this.background, palette?.background, background),
      foreground: sudo(this.foreground, palette?.foreground, foreground),
      //...surface
      primary: sudo(this.primary, palette?.primary, primary),
      secondary: sudo(this.secondary, palette?.secondary, secondary),
      ascent: sudo(this.ascent, palette?.ascent, ascent),
      //...on surface
      onPrimary: sudo(this.onPrimary, palette?.onPrimary, onPrimary),
      onSecondary: sudo(this.onSecondary, palette?.onSecondary, onSecondary),
      onAscent: sudo(this.onAscent, palette?.onAscent, onAscent),
      //...extras
      success: sudo(this.success, palette?.success, success),
      error: sudo(this.error, palette?.error, error),
      warning: sudo(this.warning, palette?.warning, warning),
    );
  }

  @override
  GlyphPreset lerp(other, t) {
    //...
    if (other is! GlyphPreset) return this;
    return GlyphPreset(
      background: TextTheme.lerp(background, other.background, t),
      foreground: TextTheme.lerp(foreground, other.foreground, t),
      //...on surface
      primary: TextTheme.lerp(primary, other.primary, t),
      secondary: TextTheme.lerp(secondary, other.secondary, t),
      ascent: TextTheme.lerp(ascent, other.ascent, t),
      //...on surface
      onPrimary: TextTheme.lerp(_primary, other._primary, t),
      onSecondary: TextTheme.lerp(_secondary, other._secondary, t),
      onAscent: TextTheme.lerp(_ascent, other._ascent, t),
      //...extras
      success: TextTheme.lerp(success, other.success, t),
      error: TextTheme.lerp(error, other.error, t),
      warning: TextTheme.lerp(warning, other.warning, t),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'background': qTextTheme.encode(background),
      'foreground': qTextTheme.encode(foreground),
      //...surface
      'primary': qTextTheme.encode(primary),
      'secondary': qTextTheme.encode(secondary),
      'ascent': qTextTheme.encode(ascent),
      //...on surface
      'onPrimary': qTextTheme.encode(onPrimary),
      'onSecondary': qTextTheme.encode(onSecondary),
      'onAscent': qTextTheme.encode(onAscent),
      //...extras
      'success': qTextTheme.encode(success),
      'error': qTextTheme.encode(error),
      'warning': qTextTheme.encode(warning),
    };
  }
}

extension ContextGlyphPreset on BuildContext {
  //...Getters
  GlyphPreset get glyphs => GlyphPreset.of(this);
}
