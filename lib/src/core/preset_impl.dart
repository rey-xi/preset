import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset/preset.dart';

/// ## Preset Impl
/// Preset values implementor class. A typical consumer
/// class for preset values. Basically, [PresetImpl] is
/// meant to implement the preset values in [MaterialApp]
/// as [MaterialApp.theme] and [ThemeData.extensions]
/// ```dart
/// PresetImpl(
///    theme: theme,
///    extensions: extensions,
///    child: child,
/// );
/// ```
class PresetImpl extends StatelessWidget {
  //...Fields
  /// Consumer theme that defines how this impl will
  /// implement preset values into the conventional
  /// material theme data.
  final ThemeData? theme;

  /// Implement preset values into the conventional
  /// material theme extension.
  final Set<ThemeExtension> extensions;

  /// Unto the next generation of widgets that is
  /// affected by this Impl implementation.
  final Widget? child;

  const PresetImpl({
    super.key,
    this.theme,
    this.extensions = const {},
    this.child,
  });

  //...Methods
  PresetImpl copyWith({
    Widget? child,
    ThemeData? theme,
    Set<ThemeExtension>? extensions,
  }) {
    return PresetImpl(
      theme: theme ?? this.theme,
      extensions: extensions ?? this.extensions,
      child: child ?? this.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    //...
    final theme = this.theme ?? themeOf(context);
    //...
    return Theme(
      data: theme.copyWith(
        extensions: {
          ...Theme.of(context).extensions.values,
          ...theme.extensions.values,
          ...extensions,
        },
      ),
      child: child ?? const SizedBox(),
    );
  }

  static ThemeData themeOf(BuildContext context) {
    //...
    return ThemeData(
      primarySwatch: context.colors.swatch,
      textTheme: context.glyphs.normal,
      iconTheme: IconThemeData(
        color: context.colors.primary,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: context.colors.primary,
      ),
      primaryTextTheme: context.glyphs.primary,
      dividerTheme: DividerThemeData(
        color: context.colors.foregroundX(255),
        thickness: .2,
        endIndent: 8,
        indent: 8,
        space: 8,
      ),
      appBarTheme: AppBarTheme(
        color: context.colors.background,
        shadowColor: context.colors.shade,
        foregroundColor: context.colors.primary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: context.colors.primary,
          systemNavigationBarColor: context.colors.primary,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: context.colors.background,
        scrimColor: context.colors.shade,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: context.colors.primary,
        minWidth: 24,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          splashFactory: InkSplash.splashFactory,
          foregroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? context.colors.primal : context.colors.primary;
          }),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          splashFactory: InkSplash.splashFactory,
          backgroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? context.colors.primalX(180) : context.colors.primalX(150);
          }),
          foregroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? context.colors.ascent : context.colors.background;
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(pressed ? 16 : 8),
            );
          }),
          elevation: MaterialStateProperty.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? 4 : 2;
          }),
          shadowColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? context.colors.primary : context.colors.subtle;
          }),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateColor.resolveWith((states) {
          final selected = states.contains(MaterialState.selected);
          return selected ? context.colors.background : context.colors.primary;
        }),
        fillColor: MaterialStateColor.resolveWith((states) {
          final selected = states.contains(MaterialState.selected);
          return selected ? context.colors.primary : context.colors.primaryX(100);
        }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: false,
        hintStyle: context.glyphs.subtle.bodyMedium,
        helperStyle: MaterialStateTextStyle.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          if (focused) {
            return context.glyphs.primal.bodySmall!;
          } else {
            return context.glyphs.primary.bodySmall!;
          }
        }),
        counterStyle: context.glyphs.primary.bodySmall,
        errorStyle: context.glyphs.error.bodySmall,
        prefixStyle: context.glyphs.normal.bodyMedium,
        suffixStyle: context.glyphs.normal.bodyMedium,
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          return focused ? context.colors.primal : context.colors.primary;
        }),
        suffixIconColor: MaterialStateColor.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          return focused ? context.colors.primal : context.colors.primary;
        }),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          if (focused) {
            return context.glyphs.primal.bodyMedium!;
          } else {
            return context.glyphs.primary.bodyMedium!;
          }
        }),
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          if (focused) {
            return context.glyphs.primal.bodyMedium!;
          } else {
            return context.glyphs.primary.bodyMedium!;
          }
        }),
        enabledBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: .5, color: context.colors.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.8, color: context.colors.primal),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: .5, color: context.colors.error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.5, color: context.colors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      ),
      scaffoldBackgroundColor: context.colors.background,
      highlightColor: context.colors.tint,
      splashColor: context.colors.tint,
      hoverColor: context.colors.shade.withAlpha(25),
      focusColor: context.colors.shade,
    );
  }
}

typedef PresetImplementation = PresetImpl Function(BuildContext context);
