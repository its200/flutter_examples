import 'package:flutter/cupertino.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: const Text('Basic'),
      ),
      child: Center(child: Text("Basic"),));
  }
}