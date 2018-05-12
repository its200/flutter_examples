import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformFullScreen extends StatefulWidget {
  static const String routeName = '/platform_full_screen';
  _PlatformFullScreen createState() => new _PlatformFullScreen();
}

class _PlatformFullScreen extends State<PlatformFullScreen> {
  static const MethodChannel _methodChannel =
      const MethodChannel('flutter.tsun.site/platform');

  int _count = 0;

  Future<Null> _launchPlatformPage() async {
    final int platformCount =
        await _methodChannel.invokeMethod("full_screen", _count);
    setState(() {
      _count = platformCount;
    });
  }

  _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Platform full screen"),
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Button tapped $_count time${ _count == 1 ? '' : 's' }.',
              style: const TextStyle(fontSize: 17.0),
            ),
            RaisedButton(
              child: Platform.isIOS
                  ? const Text('Continue in iOS view')
                  : const Text('Continue in Android view'),
              onPressed: _launchPlatformPage,
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
