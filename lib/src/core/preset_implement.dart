import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset/preset.dart';
import 'package:qp_xt_flutter/qp_xt.dart';

/// ## Preset Implement
/// Preset values implementor class. A typical consumer
/// class for preset values. Basically, [PresetImplement]
/// help to implement the preset values in [MaterialApp],
/// [MaterialApp.theme] and [ThemeData.extensions]
/// ```dart
/// PresetImpl(
///    theme: theme,
///    extensions: extensions,
///    child: child,
/// );
/// ```
class PresetImplement extends StatelessWidget {
  //...Fields
  /// Consumer theme that defines how this impl will
  /// implement preset values into the conventional
  /// material theme data.
  final ThemeData Function(ThemeData theme)? updateTheme;

  /// Implement preset values into the conventional
  /// material theme extension.
  final Set<ThemeExtension> extensions;

  /// Unto the next generation of widgets that is
  /// affected by this Impl implementation.
  final Widget? child;

  const PresetImplement({
    super.key,
    this.updateTheme,
    this.extensions = const {},
    this.child,
  });

  //...Methods
  PresetImplement copyWith({
    Widget? child,
    ThemeData Function(ThemeData theme)? updateTheme,
    Set<ThemeExtension>? extensions,
  }) {
    return PresetImplement(
      updateTheme: updateTheme ?? this.updateTheme,
      extensions: extensions ?? this.extensions,
      child: child ?? this.child,
    );
  }

  @protected
  ThemeData _updateTheme(ThemeData theme) {
    return updateTheme?.call(theme) ?? theme;
  }

  @override
  Widget build(BuildContext context) {
    //...
    final theme = _updateTheme(themeOf(context));
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
      textTheme: context.glyphs.foreground,
      primaryTextTheme: context.glyphs.onPrimary,
      scaffoldBackgroundColor: context.colors.background,
      primaryColor: context.colors.primary,
      canvasColor: context.colors.background,
      cardColor: context.colors.background,
      highlightColor: context.colors.tint,
      splashColor: context.colors.tint,
      hoverColor: context.colors.shade.withAlpha(25),
      focusColor: context.colors.shade,
      brightness: context.colors.background.isDark //
          ? Brightness.dark
          : Brightness.light,
      cardTheme: CardTheme(
        elevation: 16,
        color: context.colors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 24,
        backgroundColor: context.colors.primary,
        titleTextStyle: context.glyphs.onPrimary.titleMedium,
        contentTextStyle: context.glyphs.onPrimary.bodyMedium,
        iconColor: context.colors.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      colorScheme: ColorScheme(
        brightness: context.colors.background.isDark //
            ? Brightness.dark
            : Brightness.light,
        primary: context.colors.primary,
        onPrimary: context.colors.onPrimary,
        secondary: context.colors.secondary,
        onSecondary: context.colors.onSecondary,
        error: context.colors.error,
        onError: context.colors.onError,
        background: context.colors.background,
        onBackground: context.colors.foreground,
        surface: context.colors.background,
        onSurface: context.colors.foreground,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: context.colors.background.addSaturation(-.1),
        inputDecorationTheme: const InputDecorationTheme(),
      ),
      appBarTheme: AppBarTheme(
        color: context.colors.primary,
        shadowColor: context.colors.shade,
        foregroundColor: context.colors.onPrimary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: context.colors.primary,
          systemNavigationBarColor: context.colors.primary,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: context.colors.background,
        scrimColor: context.colors.shade,
      ),
      dividerTheme: DividerThemeData(
        color: context.colors.foreground.withAlpha(50),
        thickness: .2,
        endIndent: 8,
        indent: 8,
        space: 8,
      ),
      iconTheme: IconThemeData(
        color: context.colors.foreground,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: context.colors.onPrimary,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: context.colors.primary,
        minWidth: 24,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: context.colors.ascent,
        foregroundColor: context.colors.onAscent,
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
            final disabled = states.contains(MaterialState.disabled);
            final selected = states.contains(MaterialState.selected);
            final error = states.contains(MaterialState.error);
            if (disabled) return context.colors.subtle;
            if (selected) return context.colors.primal;
            if (error) return context.colors.error;
            return pressed //
                ? context.colors.primary
                : context.colors.primal;
          }),
          foregroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            final disabled = states.contains(MaterialState.disabled);
            final selected = states.contains(MaterialState.selected);
            final error = states.contains(MaterialState.error);
            if (disabled) return context.colors.onSubtle;
            if (selected) return context.colors.onPrimal;
            if (error) return context.colors.onError;
            return pressed //
                ? context.colors.onPrimary
                : context.colors.onPrimal;
          }),
          shape: MaterialStateProperty.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            );
          }),
          elevation: MaterialStateProperty.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? 4 : 2;
          }),
          shadowColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed //
                ? context.colors.shade
                : context.colors.subtle;
          }),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateColor.resolveWith((states) {
          final selected = states.contains(MaterialState.selected);
          return selected //
              ? context.colors.onPrimal
              : context.colors.onSubtle;
        }),
        fillColor: MaterialStateColor.resolveWith((states) {
          final selected = states.contains(MaterialState.selected);
          return selected //
              ? context.colors.primary
              : context.colors.subtle;
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
        prefixStyle: context.glyphs.foreground.bodyMedium,
        suffixStyle: context.glyphs.foreground.bodyMedium,
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          return focused ? context.colors.primal : context.colors.primary;
        }),
        suffixIconColor: MaterialStateColor.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          return focused //
              ? context.colors.primal
              : context.colors.primary;
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
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: context.colors.background.addBrightness(.1),
        contentTextStyle: context.glyphs.foreground.bodySmall,
        elevation: 6,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: context.colors.background.addBrightness(.1),
        modalBackgroundColor: context.colors.background,
        modalElevation: 8,
        elevation: 4,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.dragged)) return 8;
          if (states.contains(MaterialState.focused)) return .5;
          if (states.contains(MaterialState.pressed)) return 16;
          return 0;
        }),
        interactive: true,
        minThumbLength: 24,
        radius: const Radius.circular(16),
        thumbColor: MaterialStateProperty.resolveWith((states) {
          final dragged = states.contains(MaterialState.dragged);
          final hovered = states.contains(MaterialState.hovered);
          if (dragged) return context.colors.ascent;
          if (hovered) return context.colors.ascent;
          return context.colors.ascent.withAlpha(150);
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          final hovered = states.contains(MaterialState.hovered);
          if (hovered) return context.colors.foreground;
          return context.colors.foreground.withAlpha(25);
        }),
        trackBorderColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return context.colors.ascent.withAlpha(150);
          }
          return context.colors.ascent.withAlpha(10);
        }),
        thumbVisibility: MaterialStateProperty.all(true),
        trackVisibility: MaterialStateProperty.all(true),
      ),
    );
  }
}

typedef PresetImplementation = PresetImplement Function(BuildContext context);
