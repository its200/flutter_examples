import 'package:flutter/material.dart';

import 'package:flutter_examples/basic/animation/welcome_animation.dart';
import 'package:flutter_examples/basic/animation/flight_animation.dart';
import 'package:flutter_examples/basic/animation/dot_animation.dart';
import 'package:flutter_examples/basic/animation/fade_animation.dart';
import 'package:flutter_examples/basic/animation/size_transition_animation.dart';

class AnimationPage extends StatelessWidget {
  static const String routeName = 'animation_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demos'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Welcome page animation'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => WelcomeAnimation())),
          ),
          Divider(),
          ListTile(
            title: Text('Flight animation'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FlightAnimation())),
          ),
          Divider(),
          ListTile(
            title: Text('Dot animation'),
            onTap: () => Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => DotAnimation())),
          ),
          Divider(),
          ListTile(
            title: Text('Fade in and out'),
            onTap: () => Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (context) => FadeAnimation())),
          ),
          Divider(),
          ListTile(
            title: Text('Size Transition'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SizeTransitionAnimation())),
          ),
          Divider(),
        ],
      ),
    );
  }
}
