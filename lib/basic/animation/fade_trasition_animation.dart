import 'package:flutter/material.dart';

class FadeTransitionAnimation extends StatefulWidget {
  @override
  _FadeTransitionAnimationState createState() =>
      _FadeTransitionAnimationState();
}

class _FadeTransitionAnimationState extends State<FadeTransitionAnimation>
    with SingleTickerProviderStateMixin {
  bool _isShowing = true;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Transition Demo'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              color: Colors.green,
            ),
          ),
          Container(
            height: 30.0,
          ),
          Center(
            child: FadeTransition(
                opacity: _animationController,
                child: Center(
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.orange,
                  ),
                )),
          ),
          Container(
            width: 50.0,
            height: 50.0,
          ),
          Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.flight_takeoff),
          onPressed: () => setState(() {
                _isShowing = !_isShowing;
                if (_isShowing) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              })),
    );
  }
}
