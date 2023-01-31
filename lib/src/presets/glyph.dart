import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

/// ## Glyph Preset
/// [Typography] implementation of [PresetValue].
/// ```dart
/// GlyphPreset(
///   normal: Typography.blackRedmond,
///   alt: Typography.blackRedmond,
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
    normal: Typography.blackRedmond,
    alt: Typography.blackRedmond,
    primary: Typography.blackRedmond,
    secondary: Typography.blackRedmond,
    ascent: Typography.blackRedmond,
    success: Typography.blackRedmond,
    error: Typography.blackRedmond,
    warning: Typography.blackRedmond,
  );

  //...Redwood City
  static const redwoodCity = GlyphPreset(
    normal: Typography.blackRedwoodCity,
    alt: Typography.blackRedwoodCity,
    primary: Typography.blackRedwoodCity,
    secondary: Typography.blackRedwoodCity,
    ascent: Typography.blackRedwoodCity,
    success: Typography.blackRedwoodCity,
    error: Typography.blackRedwoodCity,
    warning: Typography.blackRedwoodCity,
  );

  //...Helsinki
  static const helsinki = GlyphPreset(
    normal: Typography.blackHelsinki,
    alt: Typography.blackHelsinki,
    primary: Typography.blackHelsinki,
    secondary: Typography.blackHelsinki,
    ascent: Typography.blackHelsinki,
    success: Typography.blackHelsinki,
    error: Typography.blackHelsinki,
    warning: Typography.blackHelsinki,
  );

  //...Mountain View
  static const mountainView = GlyphPreset(
    normal: Typography.blackMountainView,
    alt: Typography.blackMountainView,
    primary: Typography.blackMountainView,
    secondary: Typography.blackMountainView,
    ascent: Typography.blackMountainView,
    success: Typography.blackMountainView,
    error: Typography.blackMountainView,
    warning: Typography.blackMountainView,
  );

  //...Cupertino
  static const cupertino = GlyphPreset(
    normal: Typography.blackCupertino,
    alt: Typography.blackCupertino,
    primary: Typography.blackCupertino,
    secondary: Typography.blackCupertino,
    ascent: Typography.blackCupertino,
    success: Typography.blackCupertino,
    error: Typography.blackCupertino,
    warning: Typography.blackCupertino,
  );

  //...Fields
  final TextTheme primary, secondary, normal, alt;
  final TextTheme ascent, success, error, warning;

  const GlyphPreset({
    required this.primary,
    required this.secondary,
    required this.normal,
    required this.alt,
    required this.ascent,
    required this.success,
    required this.error,
    required this.warning,
  });

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
      primary: qTextTheme.decode(data['primary']) ?? redmond.primary,
      secondary: qTextTheme.decode(data['secondary']) ?? redmond.secondary,
      normal: qTextTheme.decode(data['normal']) ?? redmond.normal,
      alt: qTextTheme.decode(data['alt']) ?? redmond.alt,
      ascent: qTextTheme.decode(data['ascent']) ?? redmond.ascent,
      success: qTextTheme.decode(data['success']) ?? redmond.success,
      error: qTextTheme.decode(data['error']) ?? redmond.error,
      warning: qTextTheme.decode(data['warning']) ?? redmond.error,
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
    TextStyle? alt,
    TextStyle? ascent,
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
      primary: apply(this.primary, merge(primary, palette?.primary)),
      secondary: apply(this.secondary, merge(secondary, palette?.secondary)),
      normal: apply(this.normal, merge(normal, palette?.foreground)),
      alt: apply(this.alt, merge(alt, palette?.background)),
      ascent: apply(this.ascent, merge(ascent, palette?.ascent)),
      success: apply(this.success, merge(success, palette?.success)),
      error: apply(this.error, merge(error, palette?.error)),
      warning: apply(this.warning, merge(warning, palette?.warning)),
    );
  }

  @override
  GlyphPreset merge(other) {
    //...
    return GlyphPreset(
      primary: primary.merge(other?.primary),
      secondary: secondary.merge(other?.secondary),
      normal: normal.merge(other?.normal),
      alt: alt.merge(other?.alt),
      ascent: ascent.merge(other?.ascent),
      success: success.merge(other?.success),
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
    TextTheme? alt,
    TextTheme? ascent,
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
      primary: sudo(this.primary, palette?.primary, primary),
      secondary: sudo(this.secondary, palette?.secondary, secondary),
      normal: sudo(this.normal, palette?.foreground, normal),
      alt: sudo(this.alt, palette?.background, alt),
      ascent: sudo(this.ascent, palette?.ascent, ascent),
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
      primary: TextTheme.lerp(primary, other.primary, t),
      secondary: TextTheme.lerp(secondary, other.secondary, t),
      normal: TextTheme.lerp(normal, other.normal, t),
      alt: TextTheme.lerp(alt, other.alt, t),
      ascent: TextTheme.lerp(ascent, other.ascent, t),
      success: TextTheme.lerp(success, other.success, t),
      error: TextTheme.lerp(error, other.error, t),
      warning: TextTheme.lerp(warning, other.warning, t),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'primary': qTextTheme.encode(primary),
      'secondary': qTextTheme.encode(secondary),
      'normal': qTextTheme.encode(normal),
      'alt': qTextTheme.encode(alt),
      'ascent': qTextTheme.encode(ascent),
      'success': qTextTheme.encode(success),
      'error': qTextTheme.encode(error),
      'warning': qTextTheme.encode(warning),
    };
  }

  List<TextTheme> toList() {
    return [
      normal,
      alt,
      primary,
      secondary,
      ascent,
      success,
      warning,
      error,
    ];
  }
}

extension ContextGlyphPreset on BuildContext {
  //...Getters
  GlyphPreset get glyphs => GlyphPreset.of(this);
}
