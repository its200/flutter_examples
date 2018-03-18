import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  static const String routeName = '/hello_world';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Center(child: Text("Hello World")),
    );
  }

}