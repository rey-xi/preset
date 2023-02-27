library preset;

import 'dart:convert';

import 'package:flutter/material.dart';

part 'preset_codec.dart';

/// ## Preset Value
/// Preset encodable value that gives you access to preset
/// codec tools. Extend this class to define your own custom
/// preset value.
///
/// ```dart
/// class ValuePreset extends PresetValue<ValuePreset> {
///   //...Methods
///   @override
///   ValuePreset copyWith() {...}
//
///   @override
///   ValuePreset lerp(other, double t) {...}
//
///   @override
///   ValuePreset merge(other) {...}
//
///   @override
///   Map<String, dynamic> toJson() {...}
/// }
/// ```
abstract class PresetValue<T extends PresetValue<T>> extends ThemeExtension<T> {
  //...Fields
  const PresetValue();

  /// Retrieve an instance of [PresetValue] of type [T] from
  /// [context]. If context doesn't contain any [PresetValue]
  /// instance of type [T], this method will return null.
  static T? of<T extends PresetValue<T>>(BuildContext context) {
    //...
    try {
      return Theme.of(context).extension<T>()!;
    } catch (e) {
      return null;
    }
  }

  /// Retrieve an instance of [PresetValue] of type [T] from
  /// [context]. The returned instance of [T] will be in it's
  /// encoded form. Implement [T.fromJson] to decode an actual
  /// instance of [T] from the data returned.
  static Map<String, dynamic> parse<T extends PresetValue<T>>(String source) {
    //...
    final regex = RegExp(r'(\w+)(<[\w,]>)?\(({[:\w\s,"{}.]*\})\)');
    final match = regex.matchAsPrefix(source); // regex match data

    try {
      if (match != null) {
        if (match.group(1)?.contains('$T') ?? false) {
          return json.decode(match.group(3)!);
        }
      }
    } catch (e) {
      throw (Exception('$T could not be decoded from data'));
    }
    return {};
  }

  //...Methods
  /// merge [other] into this preset. Works as [copyWith]
  /// with all it's entry arguments assigned to [other]'s
  /// corresponding fields.
  T merge(T? other);

  /// Convert this preset value to its encodable hashmap of
  /// [String] to it's encodable data. Override this method
  /// to declare how this field can be converted to it's
  /// encodable version.
  Map<String, dynamic> toJson();

  @override
  String toString() => '$T(${json.encode(toJson())})';
}
