import 'dart:math';

import 'package:flutter/material.dart';

///Gets random color for background
class RandomGenerator {
  Color generateColor() {
    return Color.fromRGBO(_generateRandomValue(), _generateRandomValue(),
        _generateRandomValue(), 1);
  }

  int _generateRandomValue() {
    return Random().nextInt(255);
  }
}
