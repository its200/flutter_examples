import 'package:flutter/material.dart';

class DotAnimation extends StatefulWidget {
  @override
  _DotAnimationState createState() => _DotAnimationState();
}

class _DotAnimationState extends State<DotAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  _Animations _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _animation = _Animations(this._animationController);
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
    return AnimatedBuilder(
        animation: _animationController, builder: _buildAnimation);
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dot Animation'),
      ),
      body: Container(
        alignment: _animation.alignment.value,
        child: Container(
          width: _animation.width.value,
          height: _animation.height.value,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _Animations {
  _Animations(this._animationController)
      : width = Tween(begin: 60.0, end: 20.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: Curves.ease))),
        height = Tween(begin: 60.0, end: 20.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 1.0, curve: Curves.ease))),
        alignment = AlignmentTween(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).animate(new CurvedAnimation(
            parent: _animationController,
            curve: new Interval(0.0, 1.0, curve: Curves.ease)));

  final AnimationController _animationController;

  final Animation width;
  final Animation height;
  final Animation alignment;
}
