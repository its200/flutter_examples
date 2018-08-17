import 'package:flutter/material.dart';

class SizeTransitionAnimation extends StatefulWidget {
  @override
  _SizeTransitionAnimationState createState() =>
      _SizeTransitionAnimationState();
}

class _SizeTransitionAnimationState extends State<SizeTransitionAnimation>
    with SingleTickerProviderStateMixin {
  bool _isShowing = true;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
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
      body: Center(
        child: SizeTransition(
            sizeFactor: CurvedAnimation(
                //new
                parent: _animationController,
                curve: Curves.easeOut,
                reverseCurve: Curves.decelerate),
            child: Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.orange,
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.near_me),
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
