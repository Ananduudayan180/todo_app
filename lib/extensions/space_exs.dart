import 'package:flutter/material.dart';

extension IntExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get h {
    return SizedBox(height: this?.toDouble());
  }

  Widget get w {
    return SizedBox(width: this?.toDouble());
  }
}
