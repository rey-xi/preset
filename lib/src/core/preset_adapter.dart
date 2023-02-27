import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset/preset.dart';
import 'package:qp_xt/qp_xt.dart';

/// ## Preset Adapter
/// Preset values implementor class. A typical consumer
/// class for preset values. Basically, [PresetAdapter]
/// help to implement the preset values in [MaterialApp],
/// [MaterialApp.theme] and [ThemeData.extensions]
///
/// ```dart
/// PresetImpl(
///    theme: theme,
///    extensions: extensions,
///    child: child,
/// );
/// ```
class PresetAdapter extends StatelessWidget {
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

  const PresetAdapter({
    super.key,
    this.updateTheme,
    this.extensions = const {},
    this.child,
  });

  //...Methods
  PresetAdapter copyWith({
    Widget? child,
    ThemeData Function(ThemeData theme)? updateTheme,
    Set<ThemeExtension>? extensions,
  }) {
    return PresetAdapter(
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
      primarySwatch: context.spectra.swatch,
      textTheme: context.typeface.foreground,
      primaryTextTheme: context.typeface.onPrimary,
      scaffoldBackgroundColor: context.spectra.background,
      primaryColor: context.spectra.primary,
      canvasColor: context.spectra.background,
      cardColor: context.spectra.background,
      highlightColor: context.spectra.tint,
      splashColor: context.spectra.tint,
      hoverColor: context.spectra.shade.withAlpha(25),
      focusColor: context.spectra.shade,
      brightness: context.spectra.background.isDark //
          ? Brightness.dark
          : Brightness.light,
      cardTheme: CardTheme(
        elevation: 16,
        color: context.spectra.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 24,
        backgroundColor: context.spectra.primary,
        titleTextStyle: context.typeface.onPrimary.titleMedium,
        contentTextStyle: context.typeface.onPrimary.bodyMedium,
        iconColor: context.spectra.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: context.spectra.primary.withAlpha(200),
        contentTextStyle: context.typeface.onPrimary.bodyMedium,
        closeIconColor: context.spectra.onPrimary,
        actionTextColor: context.spectra.onPrimary,
        disabledActionTextColor: context.spectra.onPrimal.withAlpha(100),
        behavior: SnackBarBehavior.fixed,
        showCloseIcon: true,
        elevation: 16.0,
      ),
      colorScheme: ColorScheme(
        brightness: context.spectra.background.isDark //
            ? Brightness.dark
            : Brightness.light,
        primary: context.spectra.primary,
        onPrimary: context.spectra.onPrimary,
        secondary: context.spectra.secondary,
        onSecondary: context.spectra.onSecondary,
        error: context.spectra.error,
        onError: context.spectra.onError,
        background: context.spectra.background,
        onBackground: context.spectra.foreground,
        surface: context.spectra.background,
        onSurface: context.spectra.foreground,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: context.spectra.background.addSaturation(-.1),
        inputDecorationTheme: const InputDecorationTheme(),
      ),
      appBarTheme: AppBarTheme(
        color: context.spectra.primary,
        shadowColor: context.spectra.shade,
        foregroundColor: context.spectra.onPrimary,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: context.spectra.primary,
          systemNavigationBarColor: context.spectra.primary,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: context.spectra.background,
        scrimColor: context.spectra.shade,
      ),
      dividerTheme: DividerThemeData(
        color: context.spectra.foreground.withAlpha(50),
        thickness: .2,
        endIndent: 8,
        indent: 8,
        space: 8,
      ),
      iconTheme: IconThemeData(
        color: context.spectra.foreground,
        size: 24,
      ),
      primaryIconTheme: IconThemeData(
        color: context.spectra.onPrimary,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        buttonColor: context.spectra.primary,
        minWidth: 24,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: context.spectra.ascent,
        foregroundColor: context.spectra.onAscent,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          splashFactory: InkSplash.splashFactory,
          foregroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            return pressed ? context.spectra.primal : context.spectra.primary;
          }),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          splashFactory: InkSplash.splashFactory,
          backgroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            final disabled = states.contains(MaterialState.disabled);
            final error = states.contains(MaterialState.error);
            if (disabled) return context.spectra.subtle;
            if (error) return context.spectra.error;
            return pressed //
                ? context.spectra.primary
                : context.spectra.ascent;
          }),
          foregroundColor: MaterialStateColor.resolveWith((states) {
            final pressed = states.contains(MaterialState.pressed);
            final disabled = states.contains(MaterialState.disabled);
            final error = states.contains(MaterialState.error);
            if (disabled) return context.spectra.onSubtle;
            if (error) return context.spectra.onError;
            return pressed //
                ? context.spectra.onPrimary
                : context.spectra.onAscent;
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
            return context.spectra.shade;
          }),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateColor.resolveWith((states) {
          final selected = states.contains(MaterialState.selected);
          return selected //
              ? context.spectra.onPrimal
              : context.spectra.onSubtle;
        }),
        fillColor: MaterialStateColor.resolveWith((states) {
          final selected = states.contains(MaterialState.selected);
          return selected //
              ? context.spectra.primary
              : context.spectra.subtle;
        }),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: false,
        hintStyle: context.typeface.subtle.bodyMedium,
        helperStyle: MaterialStateTextStyle.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          if (focused) {
            return context.typeface.primal.bodySmall!;
          } else {
            return context.typeface.primary.bodySmall!;
          }
        }),
        counterStyle: context.typeface.primary.bodySmall,
        errorStyle: context.typeface.error.bodySmall,
        prefixStyle: context.typeface.foreground.bodyMedium,
        suffixStyle: context.typeface.foreground.bodyMedium,
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          return focused ? context.spectra.primal : context.spectra.primary;
        }),
        suffixIconColor: MaterialStateColor.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          return focused //
              ? context.spectra.primal
              : context.spectra.primary;
        }),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          if (focused) {
            return context.typeface.primal.bodyMedium!;
          } else {
            return context.typeface.primary.bodyMedium!;
          }
        }),
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          final focused = states.contains(MaterialState.focused);
          if (focused) {
            return context.typeface.primal.bodyMedium!;
          } else {
            return context.typeface.primary.bodyMedium!;
          }
        }),
        enabledBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: .5, color: context.spectra.primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.8, color: context.spectra.primal),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: .5, color: context.spectra.error),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.5, color: context.spectra.error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: context.spectra.background.addBrightness(.1),
        contentTextStyle: context.typeface.foreground.bodySmall,
        elevation: 6,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: context.spectra.background.addBrightness(.1),
        modalBackgroundColor: context.spectra.background,
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
          if (dragged) return context.spectra.ascent;
          if (hovered) return context.spectra.ascent;
          return context.spectra.ascent.withAlpha(150);
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          final hovered = states.contains(MaterialState.hovered);
          if (hovered) return context.spectra.foreground;
          return context.spectra.foreground.withAlpha(25);
        }),
        trackBorderColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return context.spectra.ascent.withAlpha(150);
          }
          return context.spectra.ascent.withAlpha(10);
        }),
        thumbVisibility: MaterialStateProperty.all(true),
        trackVisibility: MaterialStateProperty.all(true),
      ),
    );
  }
}

typedef PresetAdoption = PresetAdapter Function(BuildContext context);
