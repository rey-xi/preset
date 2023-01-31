# Preset Library

Advanced theme management system integrated with string codec to make user
preferences storage explicit for developers

## Getting Started

`pubspec.yaml`

### Add super text to pubspec.yaml file

```yaml

...
environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  preset:
    git: https://github.com/rey-xi/preset.git 
...

```

### Or

```yaml

...
environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter

  preset: ^0.0.1
...

```

## Usage

#### Preset

The basic and core method to declare presets. The values of presets will be
passed down to child and it's hierarchy via context.


#### Preset App

PresetApp is the most basic way to implement the preset library in your app. 
PresetApp is a direct subclass of MaterialApp with additional argument to 
assign default presets 

###### Example
```dart
@override
Widget build(BuildContext context) {
  //...
   return PresetApp(
      title: 'Preset App',
      home: const PresetHome(),
      preset: {
        ColorPreset.internal,
        GlyphPreset.redmond,
      }
   );
}
```


#### Preset Builder

Preset builder instances can be assigned to MaterialApp.builder of the 
conventional material app: If making use of the conventional Material app 
is important, making use of this method can come in handy.

###### Example
```dart
@override
Widget build(BuildContext context) {
  //...
  return MaterialApp(
    //...
    builder: PresetBuilder(
      preset: {
        ColorPreset.internal,
        GlyphPreset.redmond,
      },
      implementation: implementation,
    ),
  );
}
```


#### Preset Codec

Conversion algorithm for Preset and PresetValue. Few default preset codecs 
have been declared in the library including:

- qTextTheme or TextThemeCodec for **TextTheme**
- qTextStyle or TextStyleCodec for **TextStyle**
- qLocale or LocaleCodec for **Locale**
- qColor or ColorCodec for **Color**

###### Example
```dart
 encode(TextStyle obj) {
   final type1 = qTextStyle.encode(obj);
   final type2 = TextStyleCodec().encode(obj);
 }
```


#### Preset Impl

Preset values implementor class. A typical consumer class for preset values.
Basically, PresetImpl is meant to implement the preset values in MaterialApp
as MaterialApp.theme and ThemeData.extensions

###### Example
```dart
  @override
Widget build(BuildContext context) {
  //...
  return Container(
    child: PresetImpl(
      theme: theme,
      extensions: extensions,
      child: child,
    ),
  );
}
```



## Working Example:
```dart
import 'package:flutter/material.dart';
import 'package:popup/popup.dart';
import 'package:preset/preset.dart' as preset;
import 'package:rey_xi/screens/splash.dart';
import 'package:text2/text2.dart';

void main() {
  runApp(const PresetApp());
}

class PresetApp extends StatelessWidget {
  //...Fields
  const PresetApp({super.key});

  //...Methods
  @override
  Widget build(BuildContext context) {
    //...
    return preset.PresetApp(
      title: 'Nueli',
      home: const PresetSplash(),
      defaultPresets: const [
        ColorPreset(
          primary: Color(0xFF7E677E),
          foreground: Color(0xFF6E6A6E),
          secondary: Color(0xffd08686),
          success: Color(0xff499f51),
          error: Color(0xffdc5856),
          warning: Color(0xffe5ad71),
          background: Color(0xffe1dacb),
          ascent: Color(0xffe7cfae),
          shade: Color(0x5a75503d),
          tint: Color(0x5af5ede2),
        ), 
        GlyphPreset.mountainView,
      ],
    );
  }
}
```
### Thanks.