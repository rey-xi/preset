library preset;

import 'dart:convert';

import 'package:flutter/material.dart';

part 'preset_codec.dart';

class PresetValue<T extends PresetValue<T>> extends ThemeExtension<T> {
  //...Fields
  final Map<String, dynamic> data;

  const PresetValue([this.data = const {}]);

  factory PresetValue.parse(String data) {
    //...
    final regex = RegExp(r'(\w+)(<[\w,]>)?\(({[:\w\s,"{}.]*\})\)');
    final match = regex.matchAsPrefix(data);

    try {
      if (match != null) {
        if (match.group(1)?.contains('$T') ?? false) {
          return PresetValue<T>(json.decode(match.group(3)!));
        }
      }
    } catch (e) {
      throw (Exception('$T could not be decoded from data'));
    }
    return PresetValue<T>();
  }

  factory PresetValue.of(BuildContext context) {
    //...
    try {
      return Theme.of(context).extension<T>()!;
    } catch (e) {
      throw (Exception('$T was not found in the given context'));
    }
  }

  //...Getters
  @override
  Object get type => T;

  operator [](String iD) => data[iD];

  //...Methods
  @override
  T copyWith() => this as T;

  @override
  T lerp(other, t) => this as T;

  @override
  String toString({DiagnosticLevel? minLevel}) {
    return '$T(${json.encode(data)})';
  }
}
