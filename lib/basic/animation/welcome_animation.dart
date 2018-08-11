import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WelcomeAnimation extends StatefulWidget {
  @override
  _WelcomeAnimationState createState() => _WelcomeAnimationState();
}

class _WelcomeAnimationState extends State<WelcomeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  _WelcomeAnimation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _animation = _WelcomeAnimation(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animation.backgroundBlur.value);
    return Scaffold(
        body: AnimatedBuilder(
            animation: _animationController, builder: _buildAnimation));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('assets/images/lake.jpg', fit: BoxFit.cover),
        BackdropFilter(
            filter: ui.ImageFilter.blur(
                sigmaX: _animation.backgroundBlur.value,
                sigmaY: _animation.backgroundBlur.value),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildLogo(),
                    _buildText(),
                    _buildBottom()
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildLogo() {
    return Transform(
      transform: Matrix4.diagonal3Values(
        _animation.logoSize.value,
        _animation.logoSize.value,
        1.0,
      ),
      child: Container(
        width: 110.0,
        height: 110.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white30),
        ),
        margin: const EdgeInsets.only(top: 32.0, left: 16.0),
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
          child: FlutterLogo(
            style: FlutterLogoStyle.stacked,
            colors: Colors.deepOrange,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    TextStyle textStyle = TextStyle(
      color: Colors.white.withOpacity(_animation.textOpacity.value),
      fontSize: 25.0,
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Hello World',
            style: textStyle,
          ),
          Container(
            color: Colors.white.withOpacity(0.80),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 300.0,
            height: 2.0,
          ),
          Text(
            'Yes!',
            style: textStyle,
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Transform(
      transform:
          Matrix4.translationValues(_animation.bottomMove.value, 0.0, 0.0),
      child: Opacity(
        opacity: _animation.bottomOpacity.value,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Card(
                color: Colors.white,
                child: FlutterLogo(
                  size: 80.0,
                  colors: Colors.green,
                ),
              ),
              Card(
                color: Colors.white,
                child: FlutterLogo(
                  size: 80.0,
                  colors: Colors.blue,
                ),
              ),
              Card(
                color: Colors.white,
                child: FlutterLogo(
                  size: 80.0,
                  colors: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeAnimation {
  _WelcomeAnimation(this._controller)
      : backgroundBlur = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, 0.8, curve: Curves.ease))),
        logoSize = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1, 0.5, curve: Curves.bounceOut))),
        textOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 0.8, curve: Curves.fastOutSlowIn))),
        bottomOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.6, 1.0, curve: Curves.easeIn))),
        bottomMove = Tween(begin: 80.0, end: 0.0).animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.6, 1.0, curve: Curves.easeIn)));

  final AnimationController _controller;
  final Animation backgroundBlur;
  final Animation logoSize;
  final Animation textOpacity;
  final Animation bottomOpacity;
  final Animation bottomMove;
}
