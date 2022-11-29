import 'dart:math';

import 'package:flutter/material.dart';

///Gets from [_ways] one random way for gradients, usually
///it needs 2 time for double click
class RandomGradientWay {
  final List<Alignment> _ways = [
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
  ];

  Alignment getRandom() {
    return _ways[Random().nextInt(_ways.length)];
  }
}
