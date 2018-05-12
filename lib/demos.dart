import 'model/all_models.dart';
import 'all_demos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';

final List<RowItem> basicItems = <RowItem>[
  new RowItem(
    name: "Hello World",
    description: "First Demo",
    routeName: HelloWorld.routeName,
    buildRoute: (BuildContext context) => HelloWorld(),
  ),
  new RowItem(
    name: "Form",
    description: "A login page to show basic form feature",
    routeName: FormDemo.routeName,
    buildRoute: (BuildContext context) => FormDemo(),
  ),
  new RowItem(
    name: "Overscroll with Http Request",
    description: "A pull to refresh widget with http response to render page",
    routeName: OverscrollHttp.routeName,
    buildRoute: (BuildContext context) => OverscrollHttp(),
  ),
  new RowItem(
    name: "Platform Channel",
    description: "Android platform channel",
    routeName: PlatformChannel.routeName,
    buildRoute: (BuildContext context) => PlatformChannel(),
  ),
  new RowItem(
    name: "Platform Full Screen",
    description: "Open a platform page as full screen",
    routeName: PlatformFullScreen.routeName,
    buildRoute: (BuildContext context) => PlatformFullScreen(),
  ),
];

final List<RowItem> uiItems = <RowItem>[
  new RowItem(
    name: "Cupertino Bottom Modal",
    description: "bottom modal with Curpertino widget",
    routeName: CupertinoBottomModal.routeName,
    buildRoute: (BuildContext context) => CupertinoBottomModal(),
  ),
  new RowItem(
    name: "Layout",
    description: "a set of layout demos",
    routeName: LayoutDemo.routeName,
    buildRoute: (BuildContext context) => LayoutDemo(),
  ),
  new RowItem(
    name: "Bottom Icon Badge",
    description: "a badge showing right top of an icon",
    routeName: BottomIconBadge.routeName,
    buildRoute: (BuildContext context) => BottomIconBadge(),
  ),
];

final List<RowItem> otherItems = <RowItem>[
  new RowItem(
    name: "Local Auth",
    description:
        "local, on-device authentication with iOS (Touch ID or lock code) and the fingerprint APIs on Android (introduced in Android 6.0)",
    routeName: LocalAuth.routeName,
    buildRoute: (BuildContext context) => LocalAuth(),
  ),
  new RowItem(
    name: "Push Notification",
    description: "push notification using firebase_messaging",
    routeName: PushNotification.routeName,
    buildRoute: (BuildContext context) => PushNotification(),
  ),
  new RowItem(
    name: "QR Code Reader",
    description: "scanning 2D barcodes and QR codes",
    routeName: QRCodeReader.routeName,
    buildRoute: (BuildContext context) => QRCodeReader(),
  ),
  new RowItem(
    name: "Webview",
    description: "Web view open a PDF",
    routeName: WebViewPage.routeName,
    buildRoute: (BuildContext context) => WebViewPage(),
  ),
  new RowItem(
    name: "Url Launch",
    description: "Launch a url",
    routeName: UrlLaunchDemo.routeName,
    buildRoute: (BuildContext context) => UrlLaunchDemo(),
  )
];

final kAllDemos = basicItems + uiItems + otherItems;

Widget createDemoList(BuildContext context, String title, List list) {
  return new CupertinoPageScaffold(
    child: new CustomScrollView(
      slivers: <Widget>[
        new CupertinoSliverNavigationBar(
          largeTitle: Text(title),
          trailing: TextIcon(),
        ),
        new SliverPadding(
          // Top media padding consumed by CupertinoSliverNavigationBar.
          // Left/Right media padding consumed by Tab1RowItem.
          padding: MediaQuery
              .of(context)
              .removePadding(
                removeTop: true,
                removeLeft: true,
                removeRight: true,
              )
              .padding,
          sliver: new SliverList(
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return new OneRow(rowItem: list[index]);
              },
              childCount: list.length,
            ),
          ),
        ),
      ],
    ),
  );
}

class OneRow extends StatelessWidget {
  const OneRow({
    @required this.rowItem,
  });

  final rowItem;

  @override
  Widget build(BuildContext context) {
    final Widget row = new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (rowItem.routeName != null) {
          Timeline.instantSync('Start Transition', arguments: <String, String>{
            'from': '/',
            'to': rowItem.routeName
          });
          Navigator
              .of(context, rootNavigator: true)
              .pushNamed(rowItem.routeName);
        }
      },
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
          child: new Row(
            children: <Widget>[
              new Container(
                height: 60.0,
                width: 60.0,
                child: new Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(rowItem.name),
                      new Padding(padding: const EdgeInsets.only(top: 8.0)),
                      new Text(
                        rowItem.description,
                        style: const TextStyle(
                          color: const Color(0xFF8E8E93),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return new Column(
      children: <Widget>[
        row,
        new Container(
          height: 1.0,
          color: const Color(0xFFD9D9D9),
        ),
      ],
    );
  }
}

class TextIcon extends StatelessWidget {
  const TextIcon();
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[new Icon(Icons.exit_to_app), new Text("Exit")],
    );
  }
}
