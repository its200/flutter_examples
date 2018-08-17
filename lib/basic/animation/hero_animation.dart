import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(' Hero Animation'),
      ),
      body: new InkWell(
        onTap: () {
          Navigator.of(context).push(
            new MaterialPageRoute<Null>(builder: (BuildContext context) {
              return SecondPage();
            }),
          );
        },
        // Main route
        child: SizedBox(
          width: 150.0,
          child: new Hero(
            tag: 'Hero',
            child: new Image.asset(
              'assets/images/lake-tekapo.jpg',
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Second Page'),
      ),
      body: new Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.topLeft,
        color: Colors.lightBlueAccent,
        child: new Hero(
          tag: 'Hero',
          child: new Image.asset(
            'assets/images/lake-tekapo.jpg',
          ),
        ),
      ),
    );
  }
}
