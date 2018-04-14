import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  static const String routeName = '/hello_world';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hello Flutter"),
      ),
      body: new Center(child: new Text("Hello World")),
    );
  }
}
