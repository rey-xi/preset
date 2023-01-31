part of preset;

/// ## Preset Codec
/// Conversion algorithm for [Preset] and [PresetValue]
/// Few default preset codecs have been declared in the
/// library including:
/// - [qTextTheme] or [TextThemeCodec] for [TextTheme]
/// - [qTextStyle] or [TextStyleCodec] for [TextStyle]
/// - [qLocale] or [LocaleCodec] for [Locale]
/// - [qColor] or [ColorCodec] for [Color]
///
/// ```dart
/// encode(TextStyle obj) {
///   final type1 = qTextStyle.encode(obj);
///   final type2 = TextStyleCodec().encode(obj);
/// }
/// ```
abstract class PresetCodec<T> {
  //...Fields
  const PresetCodec();

  //...Methods
  /// Convert [obj] of type [T] to a map of [String] to
  /// json encodable objects. Can only be called once for
  /// each object in data heap.
  Map<String, dynamic> encode(T? obj);

  /// Revert an encoded map of [String] to json encodable
  /// objects to an instance of [T]. Return null if [data]
  /// is null or conversion fails.
  T? decode(Map<String, dynamic>? data);
}

//```codec]
const qTextTheme = TextThemeCodec();
const qTextStyle = TextStyleCodec();
const qLocale = LocaleCodec();
const qColor = ColorCodec();
//```

/// ## TextThemeCodec
/// ~Preset Codec for [TextTheme]. See [PresetCodec].
///
/// ```dart
/// encode(TextTheme obj) {
///   final type1 = qTextTheme.encode(obj);
///   final type2 = TextThemeCodec().encode(obj);
/// }
/// ```
class TextThemeCodec extends PresetCodec<TextTheme> {
  //...Fields
  const TextThemeCodec();

  //...Methods
  @override
  Map<String, dynamic> encode(TextTheme? obj) {
    if (obj == null) return {};
    return {
      'displayLarge': qTextStyle.encode(obj.displayLarge),
      'displayMedium': qTextStyle.encode(obj.displayMedium),
      'displaySmall': qTextStyle.encode(obj.displaySmall),
      'headlineLarge': qTextStyle.encode(obj.headlineLarge),
      'headlineMedium': qTextStyle.encode(obj.headlineMedium),
      'headlineSmall': qTextStyle.encode(obj.headlineSmall),
      'titleLarge': qTextStyle.encode(obj.titleLarge),
      'titleMedium': qTextStyle.encode(obj.titleMedium),
      'titleSmall': qTextStyle.encode(obj.titleSmall),
      'bodyLarge': qTextStyle.encode(obj.bodyLarge),
      'bodyMedium': qTextStyle.encode(obj.bodyMedium),
      'bodySmall': qTextStyle.encode(obj.bodySmall),
      'labelLarge': qTextStyle.encode(obj.labelLarge),
      'labelMedium': qTextStyle.encode(obj.labelMedium),
      'labelSmall': qTextStyle.encode(obj.labelSmall),
      'headline1': qTextStyle.encode(obj.headline1),
      'headline2': qTextStyle.encode(obj.headline2),
      'headline3': qTextStyle.encode(obj.headline3),
      'headline4': qTextStyle.encode(obj.headline4),
      'headline5': qTextStyle.encode(obj.headline5),
      'headline6': qTextStyle.encode(obj.headline6),
      'subtitle1': qTextStyle.encode(obj.subtitle1),
      'subtitle2': qTextStyle.encode(obj.subtitle2),
      'bodyText1': qTextStyle.encode(obj.bodyText1),
      'bodyText2': qTextStyle.encode(obj.bodyText2),
      'caption': qTextStyle.encode(obj.caption),
      'button': qTextStyle.encode(obj.button),
      'overline': qTextStyle.encode(obj.overline),
    };
  }

  @override
  TextTheme? decode(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return TextTheme(
      headline1: qTextStyle.decode(data['headline1']),
      headline2: qTextStyle.decode(data['headline2']),
      headline3: qTextStyle.decode(data['headline3']),
      headline4: qTextStyle.decode(data['headline4']),
      headline5: qTextStyle.decode(data['headline5']),
      headline6: qTextStyle.decode(data['headline6']),
      subtitle1: qTextStyle.decode(data['subtitle1']),
      subtitle2: qTextStyle.decode(data['subtitle2']),
      bodyText1: qTextStyle.decode(data['bodyText1']),
      bodyText2: qTextStyle.decode(data['bodyText2']),
      caption: qTextStyle.decode(data['caption']),
      button: qTextStyle.decode(data['button']),
      overline: qTextStyle.decode(data['overline']),
    ).merge(
      TextTheme(
        displayLarge: qTextStyle.decode(data['displayLarge']),
        displayMedium: qTextStyle.decode(data['displayMedium']),
        displaySmall: qTextStyle.decode(data['displaySmall']),
        headlineLarge: qTextStyle.decode(data['headlineLarge']),
        headlineMedium: qTextStyle.decode(data['headlineMedium']),
        headlineSmall: qTextStyle.decode(data['headlineSmall']),
        titleLarge: qTextStyle.decode(data['titleLarge']),
        titleMedium: qTextStyle.decode(data['titleMedium']),
        titleSmall: qTextStyle.decode(data['titleSmall']),
        bodyLarge: qTextStyle.decode(data['bodyLarge']),
        bodyMedium: qTextStyle.decode(data['bodyMedium']),
        bodySmall: qTextStyle.decode(data['bodySmall']),
        labelLarge: qTextStyle.decode(data['labelLarge']),
        labelMedium: qTextStyle.decode(data['labelMedium']),
        labelSmall: qTextStyle.decode(data['labelSmall']),
      ),
    );
  }
}

/// ## TextStyleCodec
/// ~Preset Codec for [TextStyle]. See [PresetCodec].
///
/// ```dart
/// encode(TextStyle obj) {
///   final type1 = qTextStyle.encode(obj);
///   final type2 = TextStyleCodec().encode(obj);
/// }
/// ```
class TextStyleCodec extends PresetCodec<TextStyle> {
  //...Fields
  const TextStyleCodec();

  //...Methods
  @override
  Map<String, dynamic> encode(TextStyle? obj) {
    if (obj == null) return {};
    return {
      'inherit': obj.inherit,
      'color': qColor.encode(obj.color),
      'backgroundColor': qColor.encode(obj.backgroundColor),
      'fontSize': obj.fontSize,
      'fontWeight': obj.fontWeight?.index,
      'fontStyle': obj.fontStyle?.index,
      'letterSpacing': obj.letterSpacing,
      'wordSpacing': obj.wordSpacing,
      'textBaseline': obj.textBaseline?.index,
      'height': obj.height,
      'leading': obj.leadingDistribution?.index,
      'locale': qLocale.encode(obj.locale),
      'decorationColor': qColor.encode(obj.decorationColor),
      'decorationStyle': obj.decorationStyle?.index,
      'decorationThickness': obj.decorationThickness,
      'fontFamily': obj.fontFamily,
      'fontFamilyFallback': obj.fontFamilyFallback,
      'overflow': obj.overflow?.index,
    };
  }

  @override
  TextStyle? decode(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return TextStyle(
      inherit: data['inherit'],
      color: qColor.decode(data['color']),
      backgroundColor: qColor.decode(data['backgroundColor']),
      fontSize: data['fontSize'],
      fontWeight: FontWeight.values[data['fontWeight'] ?? 3],
      fontStyle: FontStyle.values[data['fontStyle'] ?? 0],
      letterSpacing: data['letterSpacing'],
      wordSpacing: data['wordSpacing'],
      textBaseline: TextBaseline.values[data['textBaseline'] ?? 0],
      height: data['height'],
      leadingDistribution: TextLeadingDistribution.values[data['leading'] ?? 0],
      locale: qLocale.decode(data['locale']),
      decorationColor: qColor.decode(data['decorationColor']),
      decorationStyle: TextDecorationStyle.values[data['decorationStyle'] ?? 0],
      decorationThickness: data['decorationThickness'],
      fontFamily: data['fontFamily'],
      fontFamilyFallback: data['fontFamilyFallback'],
      overflow: TextOverflow.values[data['overflow'] ?? 0],
    );
  }
}

/// ## LocaleCodec
/// ~Preset Codec for [Locale]. See [PresetCodec].
///
/// ```dart
/// encode(Locale obj) {
///   final type1 = qLocale.encode(obj);
///   final type2 = LocaleCodec().encode(obj);
/// }
/// ```
class LocaleCodec extends PresetCodec<Locale> {
  //...Fields
  const LocaleCodec();

  //...Methods
  @override
  Map<String, dynamic> encode(Locale? obj) {
    if (obj == null) return {};
    return {
      'languageCode': obj.languageCode,
      'countryCode': obj.countryCode,
      'scriptCode': obj.scriptCode,
    };
  }

  @override
  Locale? decode(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return Locale.fromSubtags(
      languageCode: data['languageCode'] ?? 'und',
      countryCode: data['countryCode'],
      scriptCode: data['scriptCode'],
    );
  }
}

/// ## ColorCodec
/// ~Preset Codec for [Color]. See [PresetCodec].
///
/// ```dart
/// encode(Color obj) {
///   final type1 = qColor.encode(obj);
///   final type2 = ColorCodec().encode(obj);
/// }
/// ```
class ColorCodec extends PresetCodec<Color> {
  //...Fields
  const ColorCodec();

  //...Methods
  @override
  Map<String, dynamic> encode(Color? obj) {
    if (obj == null) return {};
    return {'value': obj.value};
  }

  @override
  Color? decode(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return Color(data['value']);
  }
}
