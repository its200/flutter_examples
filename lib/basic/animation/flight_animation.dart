import 'package:flutter/material.dart';
import 'dart:math';

class FlightAnimation extends StatefulWidget {
  @override
  _FlightAnimationState createState() => _FlightAnimationState();
}

class _FlightAnimationState extends State<FlightAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation _animation;
  bool isToRight = true;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
    _animation =
        AlignmentTween(begin: Alignment(-1.0, 0.0), end: Alignment(1.0, 0.0))
            .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                FractionallySizedBox(
                  heightFactor: 0.2,
                  widthFactor: 0.2,
                  alignment: _animation.value,
                  child: Transform.rotate(
                    angle: !isToRight ? pi / 2 : -pi / 2,
                    child: Icon(
                      Icons.flight,
                      size: 80.0,
                    ),
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            if (isToRight) {
              setState(() {
                _animationController.forward();
                isToRight = !isToRight;
              });
            } else {
              setState(() {
                _animationController.reverse();
                isToRight = !isToRight;
              });
            }
          }),
    );
  }
}
