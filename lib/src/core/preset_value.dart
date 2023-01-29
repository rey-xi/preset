library preset;

import 'dart:convert';

import 'package:flutter/material.dart';

part 'preset_codec.dart';

abstract class ValuePreset<T extends ValuePreset<T>> extends ThemeExtension<T> {
  //...Fields
  const ValuePreset();

  static T? of<T extends ValuePreset<T>>(BuildContext context) {
    //...
    try {
      return Theme.of(context).extension<T>()!;
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic> parse<T extends ValuePreset<T>>(String source) {
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
  T merge(T? other);

  Map<String, dynamic> toJson();

  @override
  String toString({DiagnosticLevel? minLevel}) {
    return '$T(${json.encode(toJson())})';
  }
}
