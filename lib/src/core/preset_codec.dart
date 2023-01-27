part of preset;

abstract class PresetCodec<T> {
  //...Method
  Map<String, dynamic> en(T? obj);

  T? de(Map<String, dynamic>? data);
}

class TextThemeCodec extends PresetCodec<TextTheme> {
  //...Methods
  @override
  Map<String, dynamic> en(TextTheme? obj) {
    if (obj == null) return {};
    return {
      'displayLarge': TextStyleCodec().en(obj.displayLarge),
      'displayMedium': TextStyleCodec().en(obj.displayMedium),
      'displaySmall': TextStyleCodec().en(obj.displaySmall),
      'headlineLarge': TextStyleCodec().en(obj.headlineLarge),
      'headlineMedium': TextStyleCodec().en(obj.headlineMedium),
      'headlineSmall': TextStyleCodec().en(obj.headlineSmall),
      'titleLarge': TextStyleCodec().en(obj.titleLarge),
      'titleMedium': TextStyleCodec().en(obj.titleMedium),
      'titleSmall': TextStyleCodec().en(obj.titleSmall),
      'bodyLarge': TextStyleCodec().en(obj.bodyLarge),
      'bodyMedium': TextStyleCodec().en(obj.bodyMedium),
      'bodySmall': TextStyleCodec().en(obj.bodySmall),
      'labelLarge': TextStyleCodec().en(obj.labelLarge),
      'labelMedium': TextStyleCodec().en(obj.labelMedium),
      'labelSmall': TextStyleCodec().en(obj.labelSmall),
      'headline1': TextStyleCodec().en(obj.headline1),
      'headline2': TextStyleCodec().en(obj.headline2),
      'headline3': TextStyleCodec().en(obj.headline3),
      'headline4': TextStyleCodec().en(obj.headline4),
      'headline5': TextStyleCodec().en(obj.headline5),
      'headline6': TextStyleCodec().en(obj.headline6),
      'subtitle1': TextStyleCodec().en(obj.subtitle1),
      'subtitle2': TextStyleCodec().en(obj.subtitle2),
      'bodyText1': TextStyleCodec().en(obj.bodyText1),
      'bodyText2': TextStyleCodec().en(obj.bodyText2),
      'caption': TextStyleCodec().en(obj.caption),
      'button': TextStyleCodec().en(obj.button),
      'overline': TextStyleCodec().en(obj.overline),
    };
  }

  @override
  TextTheme? de(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return TextTheme(
      headline1: TextStyleCodec().de(data['headline1']),
      headline2: TextStyleCodec().de(data['headline2']),
      headline3: TextStyleCodec().de(data['headline3']),
      headline4: TextStyleCodec().de(data['headline4']),
      headline5: TextStyleCodec().de(data['headline5']),
      headline6: TextStyleCodec().de(data['headline6']),
      subtitle1: TextStyleCodec().de(data['subtitle1']),
      subtitle2: TextStyleCodec().de(data['subtitle2']),
      bodyText1: TextStyleCodec().de(data['bodyText1']),
      bodyText2: TextStyleCodec().de(data['bodyText2']),
      caption: TextStyleCodec().de(data['caption']),
      button: TextStyleCodec().de(data['button']),
      overline: TextStyleCodec().de(data['overline']),
    ).merge(
      TextTheme(
        displayLarge: TextStyleCodec().de(data['displayLarge']),
        displayMedium: TextStyleCodec().de(data['displayMedium']),
        displaySmall: TextStyleCodec().de(data['displaySmall']),
        headlineLarge: TextStyleCodec().de(data['headlineLarge']),
        headlineMedium: TextStyleCodec().de(data['headlineMedium']),
        headlineSmall: TextStyleCodec().de(data['headlineSmall']),
        titleLarge: TextStyleCodec().de(data['titleLarge']),
        titleMedium: TextStyleCodec().de(data['titleMedium']),
        titleSmall: TextStyleCodec().de(data['titleSmall']),
        bodyLarge: TextStyleCodec().de(data['bodyLarge']),
        bodyMedium: TextStyleCodec().de(data['bodyMedium']),
        bodySmall: TextStyleCodec().de(data['bodySmall']),
        labelLarge: TextStyleCodec().de(data['labelLarge']),
        labelMedium: TextStyleCodec().de(data['labelMedium']),
        labelSmall: TextStyleCodec().de(data['labelSmall']),
      ),
    );
  }
}

class TextStyleCodec extends PresetCodec<TextStyle> {
  //...Methods
  @override
  Map<String, dynamic> en(TextStyle? obj) {
    if (obj == null) return {};
    return {
      'inherit': obj.inherit,
      'color': ColorCodec().en(obj.color),
      'backgroundColor': ColorCodec().en(obj.backgroundColor),
      'fontSize': obj.fontSize,
      'fontWeight': obj.fontWeight?.index,
      'fontStyle': obj.fontStyle?.index,
      'letterSpacing': obj.letterSpacing,
      'wordSpacing': obj.wordSpacing,
      'textBaseline': obj.textBaseline?.index,
      'height': obj.height,
      'leading': obj.leadingDistribution?.index,
      'locale': LocaleCodec().en(obj.locale),
      'decorationColor': ColorCodec().en(obj.decorationColor),
      'decorationStyle': obj.decorationStyle?.index,
      'decorationThickness': obj.decorationThickness,
      'fontFamily': obj.fontFamily,
      'fontFamilyFallback': obj.fontFamilyFallback,
      'overflow': obj.overflow?.index,
    };
  }

  @override
  TextStyle? de(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return TextStyle(
      inherit: data['inherit'],
      color: ColorCodec().de(data['color']),
      backgroundColor: ColorCodec().de(data['backgroundColor']),
      fontSize: data['fontSize'],
      fontWeight: FontWeight.values[data['fontWeight'] ?? 3],
      fontStyle: FontStyle.values[data['fontStyle'] ?? 0],
      letterSpacing: data['letterSpacing'],
      wordSpacing: data['wordSpacing'],
      textBaseline: TextBaseline.values[data['textBaseline'] ?? 0],
      height: data['height'],
      leadingDistribution: TextLeadingDistribution.values[data['leading'] ?? 0],
      locale: LocaleCodec().de(data['locale']),
      decorationColor: ColorCodec().de(data['decorationColor']),
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
  Map<String, dynamic> en(Locale? obj) {
    if (obj == null) return {};
    return {
      'languageCode': obj.languageCode,
      'countryCode': obj.countryCode,
      'scriptCode': obj.scriptCode,
    };
  }

  @override
  Locale? de(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
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
  Map<String, dynamic> en(Color? obj) {
    if (obj == null) return {};
    return {'value': obj.value};
  }

  @override
  Color? de(Map<String, dynamic>? data) {
    if (data == null || data.isEmpty) return null;
    return Color(data['value']);
  }
}
