import 'package:flutter/material.dart';

import 'package:flutter_examples/basic/animation/welcome_animation.dart';

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
            title: Text('welcome page animation'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => WelcomeAnimation())),
          ),
          Divider()
        ],
      ),
    );
  }
}
