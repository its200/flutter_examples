import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../demos.dart';

class OtherDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return createDemoList(context, "Other Demos", otherItems);
  }
}