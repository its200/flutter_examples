import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../demos.dart';

class UIDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createDemoList(context, "UI Demos", uiItems);
  }
}
