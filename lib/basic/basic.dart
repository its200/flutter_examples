import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../demos.dart';

class BasicDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return createDemoList(context, "Basic Demos", basicItems);
  }
}



