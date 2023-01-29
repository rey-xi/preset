part of preset;

abstract class PresetCodec<T> {
  //...Fields
  const PresetCodec();

  //...Methods
  Map<String, dynamic> encode(T? obj);

  T? decode(Map<String, dynamic>? data);
}

//```codec
const textThemeCodec = TextThemeCodec();
const textStyleCodec = TextStyleCodec();
const localeCodec = LocaleCodec();
const colorCodec = ColorCodec();
//```

class TextThemeCodec extends PresetCodec<TextTheme> {
  //...Fields
  const TextThemeCodec();

  //...Methods
  @override
  Map<String, dynamic> encode(TextTheme? obj) {
    if (obj == null) return {};
    return {
      'displayLarge': textStyleCodec.encode(obj.displayLarge),
      'displayMedium': textStyleCodec.encode(obj.displayMedium),
      'displaySmall': textStyleCodec.encode(obj.displaySmall),
      'headlineLarge': textStyleCodec.encode(obj.headlineLarge),
      'headlineMedium': textStyleCodec.encode(obj.headlineMedium),
      'headlineSmall': textStyleCodec.encode(obj.headlineSmall),
      'titleLarge': textStyleCodec.encode(obj.titleLarge),
      'titleMedium': textStyleCodec.encode(obj.titleMedium),
      'titleSmall': textStyleCodec.encode(obj.titleSmall),
      'bodyLarge': textStyleCodec.encode(obj.bodyLarge),
      'bodyMedium': textStyleCodec.encode(obj.bodyMedium),
      'bodySmall': textStyleCodec.encode(obj.bodySmall),
      'labelLarge': textStyleCodec.encode(obj.labelLarge),
      'labelMedium': textStyleCodec.encode(obj.labelMedium),
      'labelSmall': textStyleCodec.encode(obj.labelSmall),
      'headline1': textStyleCodec.encode(obj.headline1),
      'headline2': textStyleCodec.encode(obj.headline2),
      'headline3': textStyleCodec.encode(obj.headline3),
      'headline4': textStyleCodec.encode(obj.headline4),
      'headline5': textStyleCodec.encode(obj.headline5),
      'headline6': textStyleCodec.encode(obj.headline6),
      'subtitle1': textStyleCodec.encode(obj.subtitle1),
      'subtitle2': textStyleCodec.encode(obj.subtitle2),
      'bodyText1': textStyleCodec.encode(obj.bodyText1),
      'bodyText2': textStyleCodec.encode(obj.bodyText2),
      'caption': textStyleCodec.encode(obj.caption),
      'button': textStyleCodec.encode(obj.button),
      'overline': textStyleCodec.encode(obj.overline),
    };
  }

  @override
  TextTheme? decode(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return TextTheme(
      headline1: textStyleCodec.decode(data['headline1']),
      headline2: textStyleCodec.decode(data['headline2']),
      headline3: textStyleCodec.decode(data['headline3']),
      headline4: textStyleCodec.decode(data['headline4']),
      headline5: textStyleCodec.decode(data['headline5']),
      headline6: textStyleCodec.decode(data['headline6']),
      subtitle1: textStyleCodec.decode(data['subtitle1']),
      subtitle2: textStyleCodec.decode(data['subtitle2']),
      bodyText1: textStyleCodec.decode(data['bodyText1']),
      bodyText2: textStyleCodec.decode(data['bodyText2']),
      caption: textStyleCodec.decode(data['caption']),
      button: textStyleCodec.decode(data['button']),
      overline: textStyleCodec.decode(data['overline']),
    ).merge(
      TextTheme(
        displayLarge: textStyleCodec.decode(data['displayLarge']),
        displayMedium: textStyleCodec.decode(data['displayMedium']),
        displaySmall: textStyleCodec.decode(data['displaySmall']),
        headlineLarge: textStyleCodec.decode(data['headlineLarge']),
        headlineMedium: textStyleCodec.decode(data['headlineMedium']),
        headlineSmall: textStyleCodec.decode(data['headlineSmall']),
        titleLarge: textStyleCodec.decode(data['titleLarge']),
        titleMedium: textStyleCodec.decode(data['titleMedium']),
        titleSmall: textStyleCodec.decode(data['titleSmall']),
        bodyLarge: textStyleCodec.decode(data['bodyLarge']),
        bodyMedium: textStyleCodec.decode(data['bodyMedium']),
        bodySmall: textStyleCodec.decode(data['bodySmall']),
        labelLarge: textStyleCodec.decode(data['labelLarge']),
        labelMedium: textStyleCodec.decode(data['labelMedium']),
        labelSmall: textStyleCodec.decode(data['labelSmall']),
      ),
    );
  }
}

class TextStyleCodec extends PresetCodec<TextStyle> {
  //...Fields
  const TextStyleCodec();

  //...Methods
  @override
  Map<String, dynamic> encode(TextStyle? obj) {
    if (obj == null) return {};
    return {
      'inherit': obj.inherit,
      'color': colorCodec.encode(obj.color),
      'backgroundColor': colorCodec.encode(obj.backgroundColor),
      'fontSize': obj.fontSize,
      'fontWeight': obj.fontWeight?.index,
      'fontStyle': obj.fontStyle?.index,
      'letterSpacing': obj.letterSpacing,
      'wordSpacing': obj.wordSpacing,
      'textBaseline': obj.textBaseline?.index,
      'height': obj.height,
      'leading': obj.leadingDistribution?.index,
      'locale': localeCodec.encode(obj.locale),
      'decorationColor': colorCodec.encode(obj.decorationColor),
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
      color: colorCodec.decode(data['color']),
      backgroundColor: colorCodec.decode(data['backgroundColor']),
      fontSize: data['fontSize'],
      fontWeight: FontWeight.values[data['fontWeight'] ?? 3],
      fontStyle: FontStyle.values[data['fontStyle'] ?? 0],
      letterSpacing: data['letterSpacing'],
      wordSpacing: data['wordSpacing'],
      textBaseline: TextBaseline.values[data['textBaseline'] ?? 0],
      height: data['height'],
      leadingDistribution: TextLeadingDistribution.values[data['leading'] ?? 0],
      locale: localeCodec.decode(data['locale']),
      decorationColor: colorCodec.decode(data['decorationColor']),
      decorationStyle: TextDecorationStyle.values[data['decorationStyle'] ?? 0],
      decorationThickness: data['decorationThickness'],
      fontFamily: data['fontFamily'],
      fontFamilyFallback: data['fontFamilyFallback'],
      overflow: TextOverflow.values[data['overflow'] ?? 0],
    );
  }
}

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
