import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

/// ## Surface
/// A more advanced definition to Spectra and other Spectra
/// dependent Preset Values. All Spectra components including
/// [Spectra.foreground] and [Spectra.background] are both
/// affected by this Preset. To depend on this Preset, easily
/// use any of it's constructor functions.
///
/// - [colorOn]
/// - [colorOf]
///
/// ```dart
/// Surface.primary.colorOn(context)
/// ```
enum Surface implements PresetValue<Surface> {
  //...
  /// Resets [Spectra.background] to default
  surface._of('surface'),

  /// Redirects [Spectra.background] to [Spectra.primary]
  primary._of('primary'),

  /// Redirects [Spectra.background] to [Spectra.primal]
  primal._of('primal'),

  /// Redirects [Spectra.background] to [Spectra.subtle]
  subtle._of('subtle'),

  /// Redirects [Spectra.background] to [Spectra.secondary]
  secondary._of('secondary'),

  /// Redirects [Spectra.background] to [Spectra.ascent]
  ascent._of('ascent'),

  /// Redirects [Spectra.foreground] to [Spectra.background]
  onSurface._on('surface'),

  /// Redirects [Spectra.foreground] to [Spectra.primary]
  onPrimary._on('primary'),

  /// Redirects [Spectra.foreground] to [Spectra.primal]
  onPrimal._on('primal'),

  /// Redirects [Spectra.foreground] to [Spectra.subtle]
  onSubtle._on('subtle'),

  /// Redirects [Spectra.foreground] to [Spectra.secondary]
  onSecondary._on('secondary'),

  /// Redirects [Spectra.foreground] to [Spectra.ascent]
  onAscent._on('ascent'),

  /// Redirects [Spectra.foreground] to [Spectra.success]
  success._of('success'),

  /// Redirects [Spectra.foreground] to [Spectra.warning]
  warning._of('warning'),

  /// Redirects [Spectra.foreground] to [Spectra.error]
  error._of('error');

  /// The arbitrary code that connotes the surface value
  final String code;

  /// Whether surface value is alternated or direct.
  final bool alt;

  /// Create a new surface with [alt] value as false
  const Surface._of(this.code) : alt = false;

  /// Create a new surface with [alt] value as true
  const Surface._on(this.code) : alt = true;

  /// Retrieve Surface instance from [context]. If context
  /// has no instance of Surface in it, [Surface.surface]
  /// is returned.
  ///
  /// ```dart
  /// Surface.of(context).colorOn(context)
  /// ```
  factory Surface.of(BuildContext context) {
    //...
    final surface = PresetValue.of<Surface>(context);
    return surface ?? Surface.surface; // surface fallback
  }

  /// Retrieve Surface instance from [source]. If source is
  /// invalid, [Surface.surface] is returned.
  ///
  /// ```dart
  /// Surface.of(context).colorOn(context)
  /// ```
  factory Surface.parse(String source, bool? alt) {
    //...
    final preset = PresetValue.parse<Surface>(source);
    alt ??= preset['alt']; // Repair surface via boolean trend.
    surface(e) => e.code == preset['code'] && e.alt == alt;
    return Surface.values.firstWhere(surface);
  }

  Color colorOf(BuildContext context) {
    //...
    switch (this) {
      case surface:
        return context.spectra.background;
      case Surface.primary:
        return context.spectra.primary;
      case Surface.primal:
        return context.spectra.primal;
      case Surface.subtle:
        return context.spectra.subtle;
      case Surface.secondary:
        return context.spectra.secondary;
      case Surface.ascent:
        return context.spectra.ascent;
      case Surface.onSurface:
        return context.spectra.foreground;
      case Surface.onPrimary:
        return context.spectra.onPrimary;
      case Surface.onPrimal:
        return context.spectra.onPrimal;
      case Surface.onSubtle:
        return context.spectra.onSubtle;
      case Surface.onSecondary:
        return context.spectra.onSecondary;
      case Surface.onAscent:
        return context.spectra.onAscent;
      case Surface.success:
        return context.spectra.success;
      case Surface.warning:
        return context.spectra.warning;
      case Surface.error:
        return context.spectra.error;
    }
  }

  Color colorOn(BuildContext context) {
    //...
    switch (this) {
      case surface:
        return context.spectra.foreground;
      case Surface.primary:
        return context.spectra.onPrimary;
      case Surface.primal:
        return context.spectra.onPrimal;
      case Surface.subtle:
        return context.spectra.onSubtle;
      case Surface.secondary:
        return context.spectra.onSecondary;
      case Surface.ascent:
        return context.spectra.onAscent;
      case Surface.onSurface:
        return context.spectra.background;
      case Surface.onPrimary:
        return context.spectra.primary;
      case Surface.onPrimal:
        return context.spectra.primal;
      case Surface.onSubtle:
        return context.spectra.subtle;
      case Surface.onSecondary:
        return context.spectra.secondary;
      case Surface.onAscent:
        return context.spectra.ascent;
      case Surface.success:
        return context.spectra.onSuccess;
      case Surface.warning:
        return context.spectra.onWarning;
      case Surface.error:
        return context.spectra.onError;
    }
  }

  @override
  Type get type => Surface;

  @override
  Surface copyWith() => this;

  @override
  Surface merge(other) => other ?? this;

  @override
  Surface lerp(other, t) => other is! Surface ? this : other;

  @override
  Map<String, dynamic> toJson() => {'code': code, 'alt': alt};
}

class SurfaceVoid extends StatelessWidget {
  //...Fields
  final Surface surface;
  final Widget child;

  const SurfaceVoid({
    super.key,
    this.surface = Surface.surface,
    this.child = const SizedBox(),
  });

  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    return Preset(
      presets: {Spectra.spectrum(context, surface)},
      child: child,
    );
  }
}

class SurfaceColor extends StatelessWidget {
  //...Fields
  final Surface surface;
  final Widget child;

  const SurfaceColor({
    super.key,
    this.surface = Surface.surface,
    this.child = const SizedBox(),
  });

  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    return ColoredBox(
      color: surface.colorOf(context),
      child: SurfaceVoid(
        surface: surface,
        child: child,
      ),
    );
  }
}

class SurfaceCard extends StatelessWidget {
  //...Fields
  final Surface surface;
  final Widget child;

  const SurfaceCard({
    super.key,
    this.surface = Surface.surface,
    this.child = const SizedBox(),
  });

  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    return ColoredBox(
      color: surface.colorOf(context),
      child: SurfaceVoid(
        surface: surface,
        child: child,
      ),
    );
  }
}
