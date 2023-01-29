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

## Preset

The main widget that can be used to pass preset values across the context. Also provides 
room for custom usage distribution and shortcut access to assign preset values details to
unrecognized theme extensions. 

#### Example:
```dart
import 'package:flutter/material.dart';
import 'package:preset/preset.dart';


class PresetApp extends StatelessWidget {
  const PresetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Mat3D().scale(1.5).forward(24).matrix,
              child: const Text("Transformed"),
            ),
          ],
        ),
      ),
    );
  }
}
```


- **Raw Constructor:** Mat3D can be created to tweak a Matrix4 value using
  a given rect.

#### Example:
```dart
main() {
  final matrix4 = Matrix4.identity();
  final rect = Offset.zero & const Size.square(100);
  final mat3D = Mat3D.raw(rect: rect, matrix: matrix4);

  /// changes to [mat3D] reflects on [matrix4]
  print(mat3D); // Mat3D[...](0, 0, 100, 100)
}
```


- **Parse Constructor:** Mat3D can be composed from a string source: result
  calling [.toString()] on a Mat3D object.

#### Example:
```dart
main() {
  final matrix4 = Matrix4.identity();
  final rect = Offset.zero & const Size.square(100);
  final mat3D = Mat3D(rect: rect, matrix: matrix4);
  print(mat3D);  // Mat3D[0, 1.0, 1.0...](0, 0, 100, 100)
  final mat3D2 = Mat3D.parse('$mat3D');
  print(mat3D2);  // Mat3D[0, 1.0, 1.0...](0, 0, 100, 100)
}
```


- **Copy Constructor:** Mat3D can be duplicated as redirection from another
- 
- 

#### Example:
```dart
main() {
  final matrix4 = Matrix4.identity();
  final rect = Offset.zero & const Size.square(100);
  final mat3D = Mat3D.raw(rect: rect, matrix: matrix4);
  print(mat3D); // Mat3D[0, 1.0, 1.0...](0, 0, 100, 100)
  final mat3D2 = Mat3D.from(mat3D);

  /// changes to [mat3D2] reflects on [mat3D]
  print(mat3D2); // Mat3D[0, 1.0, 1.0...](0, 0, 100, 100)
}
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:mat3d/mat3d.dart';


class Mat3DExample extends StatelessWidget {
  const Mat3DExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Mat3D().scale(1.5).forward(24).matrix,
              child: const Text("Transformed"),
            ),
          ],
        ),
      ),
    );
  }
}

```
### Thanks