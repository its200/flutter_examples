import 'package:flutter/material.dart';
import 'dart:math';

class FlightAnimation extends StatefulWidget {
  @override
  _FlightAnimationState createState() => _FlightAnimationState();
}

class _FlightAnimationState extends State<FlightAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        lowerBound: -1.0,
        upperBound: 1.0,
        duration: Duration(milliseconds: 3000),
        vsync: this)
      ..addListener(() => this.setState(() {}));
    super.initState();
    _animationController.forward(from: -1.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.2,
            widthFactor: 0.2,
            alignment: Alignment(_animationController.value, 0.0),
            child: Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.flight,
                size: 80.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
