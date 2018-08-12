import 'package:flutter/material.dart';

import 'package:flutter_examples/basic/animation/welcome_animation.dart';
import 'package:flutter_examples/basic/animation/flight_animation.dart';

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
        ],
      ),
    );
  }
}
