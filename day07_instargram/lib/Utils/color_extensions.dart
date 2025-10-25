import 'dart:math';
import 'package:flutter/material.dart';

extension ColorsExtensions on Colors {
  static Color randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
