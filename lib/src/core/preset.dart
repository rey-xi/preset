import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:preset/src/core/preset_value.dart';

import '../presets/color.dart';
import '../presets/glyph.dart';

class Preset extends StatelessWidget {
  //...Fields
  final Iterable<ValuePreset> presets;
  final Iterable<ThemeExtension> extensions;
  final ThemeData? distribution;
  final Widget? child;

  const Preset({
    super.key,
    this.presets = const {},
    this.extensions = const {},
    this.distribution,
    this.child,
  });

  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    Widget? child = this.child;
    return Theme(
      data: Theme.of(context).copyWith(
        extensions: {
          ...Theme.of(context).extensions.values,
          ...presets,
        },
      ),
      child: Builder(builder: (context) {
        //...
        final colors = ColorPreset.of(context);
        final glyphs = GlyphPreset.of(context);
        final theme = distribution ??
            ThemeData(
              colorSchemeSeed: colors.primary,
              textTheme: glyphs.normal,
              iconTheme: IconThemeData(
                color: colors.primary,
                size: 24,
              ),
              primaryIconTheme: IconThemeData(
                color: colors.primary,
              ),
              primaryTextTheme: glyphs.primary,
              dividerTheme: DividerThemeData(
                color: colors.foregroundX(255),
                thickness: .2,
                endIndent: 8,
                indent: 8,
                space: 8,
              ),
              appBarTheme: AppBarTheme(
                color: colors.background,
                shadowColor: colors.shade,
                foregroundColor: colors.primary,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: colors.primary,
                  systemNavigationBarColor: colors.primary,
                ),
              ),
              drawerTheme: DrawerThemeData(
                backgroundColor: colors.background,
                scrimColor: colors.shade,
              ),
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                buttonColor: colors.primary,
                minWidth: 24,
              ),
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  splashFactory: InkSplash.splashFactory,
                  foregroundColor: MaterialStateColor.resolveWith((states) {
                    final pressed = states.contains(MaterialState.pressed);
                    return pressed ? colors.primal : colors.primary;
                  }),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  splashFactory: InkSplash.splashFactory,
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    final pressed = states.contains(MaterialState.pressed);
                    return pressed ? colors.primalX(180) : colors.primalX(150);
                  }),
                  foregroundColor: MaterialStateColor.resolveWith((states) {
                    final pressed = states.contains(MaterialState.pressed);
                    return pressed ? colors.ascent : colors.background;
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
                    return pressed ? colors.primary : colors.subtle;
                  }),
                ),
              ),
              checkboxTheme: CheckboxThemeData(
                checkColor: MaterialStateColor.resolveWith((states) {
                  final selected = states.contains(MaterialState.selected);
                  return selected ? colors.background : colors.primary;
                }),
                fillColor: MaterialStateColor.resolveWith((states) {
                  final selected = states.contains(MaterialState.selected);
                  return selected ? colors.primary : colors.primaryX(100);
                }),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                isDense: false,
                hintStyle: glyphs.subtle.bodyMedium,
                helperStyle: MaterialStateTextStyle.resolveWith((states) {
                  final focused = states.contains(MaterialState.focused);
                  if (focused) {
                    return glyphs.primal.bodySmall!;
                  } else {
                    return glyphs.primary.bodySmall!;
                  }
                }),
                counterStyle: glyphs.primary.bodySmall,
                errorStyle: glyphs.error.bodySmall,
                prefixStyle: glyphs.normal.bodyMedium,
                suffixStyle: glyphs.normal.bodyMedium,
                prefixIconColor: MaterialStateColor.resolveWith((states) {
                  final focused = states.contains(MaterialState.focused);
                  return focused ? colors.primal : colors.primary;
                }),
                suffixIconColor: MaterialStateColor.resolveWith((states) {
                  final focused = states.contains(MaterialState.focused);
                  return focused ? colors.primal : colors.primary;
                }),
                floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
                  final focused = states.contains(MaterialState.focused);
                  if (focused) {
                    return glyphs.primal.bodyMedium!;
                  } else {
                    return glyphs.primary.bodyMedium!;
                  }
                }),
                labelStyle: MaterialStateTextStyle.resolveWith((states) {
                  final focused = states.contains(MaterialState.focused);
                  if (focused) {
                    return glyphs.primal.bodyMedium!;
                  } else {
                    return glyphs.primary.bodyMedium!;
                  }
                }),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
                  borderSide: BorderSide(width: .5, color: colors.primary),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
                  borderSide: BorderSide(width: 1.8, color: colors.primal),
                ),
                errorBorder: UnderlineInputBorder(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
                  borderSide: BorderSide(width: .5, color: colors.error),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4.0)),
                  borderSide: BorderSide(width: 1.5, color: colors.error),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              ),
              scaffoldBackgroundColor: colors.background,
              highlightColor: colors.tint,
              splashColor: colors.tint,
              hoverColor: colors.shade,
              focusColor: colors.shade,
            );
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
      }),
    );
  }
}
