library preset;

import 'package:flutter/material.dart';
import 'package:preset/preset.dart';

export 'src/core/preset.dart';
export 'src/core/preset_adapter.dart';
export 'src/core/preset_app.dart';
export 'src/core/preset_value.dart';
export 'src/presets/spectra.dart';
export 'src/presets/surface.dart';
export 'src/presets/typeface.dart';

extension ContextualPreset on BuildContext {
  //...Getters
  /// Shortcut to load Theme data from context
  ThemeData get theme => Theme.of(this);

  /// Shortcut to load MediaQuery data from context
  MediaQueryData get data => MediaQuery.of(this);

  /// Shortcut to load Spectra from context
  Spectra get spectra => Spectra.of(this);

  /// Shortcut to load Typeface from context
  Typeface get typeface => Typeface.of(this);

  /// Shortcut to load Surface from context
  Surface get surface => Surface.of(this);
}
