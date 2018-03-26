import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomIconBadge extends StatelessWidget {
  static const String routeName = '/bottom_icon_badge';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Bottom Icon Badge",
      home: Scaffold(
        body: CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                title: Text('Home'),
                icon: Stack(
                    children: <Widget>[
                      Icon(Icons.home),
                      Positioned(  // draw a red marble
                        top: 0.0,
                        right: 0.0,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Icon(Icons.brightness_1, size: 16.0,
                                color: Colors.redAccent),
                            Text("7", style: TextStyle(color: Colors.white))
                          ],
                        )
                      )
                    ]
                ),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.conversation_bubble),
                title: const Text('UI'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.profile_circled),
                title: const Text('Other'),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return new DefaultTextStyle(
              style: const TextStyle(
                fontFamily: '.SF UI Text',
                fontSize: 17.0,
                color: CupertinoColors.black,
              ),
              child: new CupertinoTabView(
                builder: (BuildContext context) {
                  return CupertinoTabView(
                    builder: (BuildContext context) {
                      switch (index) {
                        case 0:
                          return new _Home();
                          break;
                        case 1:
                          return new _UI();
                          break;
                        case 2:
                          return new _Other();
                          break;
                        default:
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
      ));
  }

}

class _Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Home"));
  }
}

class _UI extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("UI"));
  }
}

class _Other extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Other"));
  }
}