import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomIconBadge extends StatelessWidget {
  static const String routeName = '/bottom_icon_badge';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Bottom Icon Badge",
        home: new Scaffold(
          body: new CupertinoTabScaffold(
            tabBar: new CupertinoTabBar(
              items: <BottomNavigationBarItem>[
                new BottomNavigationBarItem(
                  title: new Text('Home'),
                  icon: new Stack(children: <Widget>[
                    new Icon(Icons.home),
                    new Positioned(
                        // draw a red marble
                        top: 0.0,
                        right: 0.0,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 16.0, color: Colors.redAccent),
                            const Text("7",
                                style: TextStyle(color: Colors.white))
                          ],
                        ))
                  ]),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(CupertinoIcons.conversation_bubble),
                  title: new Text('UI'),
                ),
                new BottomNavigationBarItem(
                  icon: new Icon(CupertinoIcons.profile_circled),
                  title: new Text('Other'),
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              return new DefaultTextStyle(
                style: new TextStyle(
                  fontFamily: '.SF UI Text',
                  fontSize: 17.0,
                  color: CupertinoColors.black,
                ),
                child: new CupertinoTabView(
                  builder: (BuildContext context) {
                    return new CupertinoTabView(
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
    return new Center(child: new Text("Home"));
  }
}

class _UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text("UI"));
  }
}

class _Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(child: new Text("Other"));
  }
}
