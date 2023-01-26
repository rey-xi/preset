part of preset;

abstract class PresetCodec<T> {
  //...Method
  Map<String, dynamic> encode(T? obj);

  T? decode(Map<String, dynamic> data);
}

class TextThemeCodec extends PresetCodec<TextTheme> {
  //...Methods
  @override
  Map<String, dynamic> encode(TextTheme? obj) {
    if (obj == null) return {};
    return {
      'displayLarge': TextStyleCodec().encode(obj.displayLarge),
      'displayMedium': TextStyleCodec().encode(obj.displayMedium),
      'displaySmall': TextStyleCodec().encode(obj.displaySmall),
      'headlineLarge': TextStyleCodec().encode(obj.headlineLarge),
      'headlineMedium': TextStyleCodec().encode(obj.headlineMedium),
      'headlineSmall': TextStyleCodec().encode(obj.headlineSmall),
      'titleLarge': TextStyleCodec().encode(obj.titleLarge),
      'titleMedium': TextStyleCodec().encode(obj.titleMedium),
      'titleSmall': TextStyleCodec().encode(obj.titleSmall),
      'bodyLarge': TextStyleCodec().encode(obj.bodyLarge),
      'bodyMedium': TextStyleCodec().encode(obj.bodyMedium),
      'bodySmall': TextStyleCodec().encode(obj.bodySmall),
      'labelLarge': TextStyleCodec().encode(obj.labelLarge),
      'labelMedium': TextStyleCodec().encode(obj.labelMedium),
      'labelSmall': TextStyleCodec().encode(obj.labelSmall),
      'headline1': TextStyleCodec().encode(obj.headline1),
      'headline2': TextStyleCodec().encode(obj.headline2),
      'headline3': TextStyleCodec().encode(obj.headline3),
      'headline4': TextStyleCodec().encode(obj.headline4),
      'headline5': TextStyleCodec().encode(obj.headline5),
      'headline6': TextStyleCodec().encode(obj.headline6),
      'subtitle1': TextStyleCodec().encode(obj.subtitle1),
      'subtitle2': TextStyleCodec().encode(obj.subtitle2),
      'bodyText1': TextStyleCodec().encode(obj.bodyText1),
      'bodyText2': TextStyleCodec().encode(obj.bodyText2),
      'caption': TextStyleCodec().encode(obj.caption),
      'button': TextStyleCodec().encode(obj.button),
      'overline': TextStyleCodec().encode(obj.overline),
    };
  }

  @override
  TextTheme decode(Map<String, dynamic> data) {
    return TextTheme(
      headline1: TextStyleCodec().decode(data['headline1']),
      headline2: TextStyleCodec().decode(data['headline2']),
      headline3: TextStyleCodec().decode(data['headline3']),
      headline4: TextStyleCodec().decode(data['headline4']),
      headline5: TextStyleCodec().decode(data['headline5']),
      headline6: TextStyleCodec().decode(data['headline6']),
      subtitle1: TextStyleCodec().decode(data['subtitle1']),
      subtitle2: TextStyleCodec().decode(data['subtitle2']),
      bodyText1: TextStyleCodec().decode(data['bodyText1']),
      bodyText2: TextStyleCodec().decode(data['bodyText2']),
      caption: TextStyleCodec().decode(data['caption']),
      button: TextStyleCodec().decode(data['button']),
      overline: TextStyleCodec().decode(data['overline']),
    ).merge(
      TextTheme(
        displayLarge: TextStyleCodec().decode(data['displayLarge']),
        displayMedium: TextStyleCodec().decode(data['displayMedium']),
        displaySmall: TextStyleCodec().decode(data['displaySmall']),
        headlineLarge: TextStyleCodec().decode(data['headlineLarge']),
        headlineMedium: TextStyleCodec().decode(data['headlineMedium']),
        headlineSmall: TextStyleCodec().decode(data['headlineSmall']),
        titleLarge: TextStyleCodec().decode(data['titleLarge']),
        titleMedium: TextStyleCodec().decode(data['titleMedium']),
        titleSmall: TextStyleCodec().decode(data['titleSmall']),
        bodyLarge: TextStyleCodec().decode(data['bodyLarge']),
        bodyMedium: TextStyleCodec().decode(data['bodyMedium']),
        bodySmall: TextStyleCodec().decode(data['bodySmall']),
        labelLarge: TextStyleCodec().decode(data['labelLarge']),
        labelMedium: TextStyleCodec().decode(data['labelMedium']),
        labelSmall: TextStyleCodec().decode(data['labelSmall']),
      ),
    );
  }
}

class TextStyleCodec extends PresetCodec<TextStyle> {
  //...Methods
  @override
  Map<String, dynamic> encode(TextStyle? obj) {
    if (obj == null) return {};
    return {
      'inherit': obj.inherit,
      'color': ColorCodec().encode(obj.color),
      'backgroundColor': ColorCodec().encode(obj.backgroundColor),
      'fontSize': obj.fontSize,
      'fontWeight': obj.fontWeight?.index,
      'fontStyle': obj.fontStyle?.index,
      'letterSpacing': obj.letterSpacing,
      'wordSpacing': obj.wordSpacing,
      'textBaseline': obj.textBaseline?.index,
      'height': obj.height,
      'leading': obj.leadingDistribution?.index,
      'locale': LocaleCodec().encode(obj.locale),
      'decorationColor': ColorCodec().encode(obj.decorationColor),
      'decorationStyle': obj.decorationStyle?.index,
      'decorationThickness': obj.decorationThickness,
      'fontFamily': obj.fontFamily,
      'fontFamilyFallback': obj.fontFamilyFallback,
      'overflow': obj.overflow?.index,
    };
  }

  @override
  TextStyle? decode(Map<String, dynamic> data) {
    if (data.isEmpty) return null;
    return TextStyle(
      inherit: data['inherit'],
      color: ColorCodec().decode(data['color']),
      backgroundColor: ColorCodec().decode(data['backgroundColor']),
      fontSize: data['fontSize'],
      fontWeight: FontWeight.values[data['fontWeight'] ?? 3],
      fontStyle: FontStyle.values[data['fontStyle'] ?? 0],
      letterSpacing: data['letterSpacing'],
      wordSpacing: data['wordSpacing'],
      textBaseline: TextBaseline.values[data['textBaseline'] ?? 0],
      height: data['height'],
      leadingDistribution: TextLeadingDistribution.values[data['leading'] ?? 0],
      locale: LocaleCodec().decode(data['locale']),
      decorationColor: ColorCodec().decode(data['decorationColor']),
      decorationStyle: TextDecorationStyle.values[data['decorationStyle'] ?? 0],
      decorationThickness: data['decorationThickness'],
      fontFamily: data['fontFamily'],
      fontFamilyFallback: data['fontFamilyFallback'],
      overflow: TextOverflow.values[data['overflow'] ?? 0],
    );
  }
}

class LocaleCodec extends PresetCodec<Locale> {
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
  Locale? decode(Map<String, dynamic> data) {
    if (data.isEmpty) return null;
    return Locale.fromSubtags(
      languageCode: data['languageCode'] ?? 'und',
      countryCode: data['countryCode'],
      scriptCode: data['scriptCode'],
    );
  }
}

class ColorCodec extends PresetCodec<Color> {
  //...Methods
  @override
  Map<String, dynamic> encode(Color? obj) {
    if (obj == null) return {};
    return {'value': obj.value};
  }

  @override
  Color? decode(Map<String, dynamic> data) {
    if (data.isEmpty) return null;
    return Color(data['value']);
  }
}
