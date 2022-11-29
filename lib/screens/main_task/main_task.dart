import 'package:flutter/material.dart';
import 'package:solid_software_buravikov_test/constants/constants.dart';
import 'package:solid_software_buravikov_test/provider/random_generator.dart';
import 'package:solid_software_buravikov_test/provider/random_gradient.dart';

class MainTask extends StatefulWidget {
  const MainTask({Key? key}) : super(key: key);

  @override
  State<MainTask> createState() => _MainTaskState();
}

class _MainTaskState extends State<MainTask> {
  Color? _color;
  Color? _prevColor;
  bool doubleTap = false;

  @override
  void initState() {
    _generateColor();
    _prevColor = _color;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: _body(),
    );
  }

  ///The background depends on type of click, if it uses one tap, background will be without gradient.
  ///Double click calls a gradient, which depends on [RandomGradientWay] class with alone method
  Widget _body() {
    return GestureDetector(
        onDoubleTap: () {
          setState(() {
            doubleTap = true;
          });
          _generateColor();
        },
        onTap: () {
          setState(() {
            doubleTap = false;
          });
          _generateColor();
        },
        child: AnimatedContainer(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: _color,
                gradient: doubleTap
                    ? LinearGradient(
                        begin: RandomGradientWay().getRandom(),
                        end: RandomGradientWay().getRandom(),
                        colors: [_prevColor!, _color!],
                      )
                    : null),
            duration: const Duration(milliseconds: animationDuration),
            child: _text()));
  }

  _generateColor() {
    setState(() {
      _prevColor = _color ?? RandomGenerator().generateColor();
      _color = RandomGenerator().generateColor();
    });
  }

  Widget _text() {
    return const Text(
      middleText,
      style: TextStyle(fontSize: 40, color: Colors.black),
    );
  }
}
