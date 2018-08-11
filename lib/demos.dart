import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';

import 'package:flutter_examples/all_demos.dart';

final List<RowItem> basicItems = <RowItem>[
  RowItem(
    name: "Hello World",
    description: "First Demo",
    routeName: HelloWorld.routeName,
    buildRoute: (BuildContext context) => HelloWorld(),
  ),
  RowItem(
    name: "Animation",
    description: "A collection of animation demos",
    routeName: AnimationPage.routeName,
    buildRoute: (BuildContext context) => AnimationPage(),
  ),
  RowItem(
    name: "Form",
    description: "A login page to show basic form feature",
    routeName: FormDemo.routeName,
    buildRoute: (BuildContext context) => FormDemo(),
  ),
  RowItem(
    name: "Overscroll with Http Request",
    description: "A pull to refresh widget with http response to render page",
    routeName: OverscrollHttp.routeName,
    buildRoute: (BuildContext context) => OverscrollHttp(),
  ),
  RowItem(
    name: "Platform Channel",
    description: "Android platform channel",
    routeName: PlatformChannel.routeName,
    buildRoute: (BuildContext context) => PlatformChannel(),
  ),
  RowItem(
    name: "Platform Full Screen",
    description: "Open a platform page as full screen",
    routeName: PlatformFullScreen.routeName,
    buildRoute: (BuildContext context) => PlatformFullScreen(),
  ),
  RowItem(
    name: "Page View",
    description: "PageView example with dots indicator",
    routeName: MyPageView.routeName,
    buildRoute: (BuildContext context) => MyPageView(),
  ),
];

final List<RowItem> uiItems = <RowItem>[
  RowItem(
    name: "Cupertino Bottom Modal",
    description: "bottom modal with Curpertino widget",
    routeName: CupertinoBottomModal.routeName,
    buildRoute: (BuildContext context) => CupertinoBottomModal(),
  ),
  RowItem(
    name: "Layout",
    description: "a set of layout demos",
    routeName: LayoutDemo.routeName,
    buildRoute: (BuildContext context) => LayoutDemo(),
  ),
  RowItem(
    name: "Bottom Icon Badge",
    description: "a badge showing right top of an icon",
    routeName: BottomIconBadge.routeName,
    buildRoute: (BuildContext context) => BottomIconBadge(),
  ),
  RowItem(
    name: "Hero Animation",
    description: "Animation with Hero widget",
    routeName: HeroAnimation.routeName,
    buildRoute: (BuildContext context) => HeroAnimation(),
  ),
  RowItem(
    name: "Custom List",
    description: "Custom List",
    routeName: CustomList.routeName,
    buildRoute: (BuildContext context) => CustomList(),
  ),
  RowItem(
    name: "Drawer Fragment",
    description: "Scafford drawer with multiple pages and different app bar",
    routeName: DrawerDemo.routeName,
    buildRoute: (BuildContext context) => DrawerDemo(),
  ),
  RowItem(
    name: "My Timer",
    description: "Timer",
    routeName: Timer.routeName,
    buildRoute: (BuildContext context) => Timer(),
  ),
  RowItem(
    name: "A Login Page",
    description: "Login Page",
    routeName: LoginAnimationPage.routeName,
    buildRoute: (BuildContext context) => LoginAnimationPage(),
  )
];

final List<RowItem> otherItems = <RowItem>[
  RowItem(
    name: "Local Auth",
    description:
        "local, on-device authentication with iOS (Touch ID or lock code) and the fingerprint APIs on Android (introduced in Android 6.0)",
    routeName: LocalAuth.routeName,
    buildRoute: (BuildContext context) => LocalAuth(),
  ),
  RowItem(
    name: "Push Notification",
    description: "push notification using firebase_messaging",
    routeName: PushNotification.routeName,
    buildRoute: (BuildContext context) => PushNotification(),
  ),
  RowItem(
    name: "QR Code Reader",
    description: "scanning 2D barcodes and QR codes",
    routeName: QRCodeReader.routeName,
    buildRoute: (BuildContext context) => QRCodeReader(),
  ),
  RowItem(
    name: "Webview",
    description: "Web view open a PDF",
    routeName: WebViewPage.routeName,
    buildRoute: (BuildContext context) => WebViewPage(),
  ),
  RowItem(
    name: "Url Launch",
    description: "Launch a url",
    routeName: UrlLaunchDemo.routeName,
    buildRoute: (BuildContext context) => UrlLaunchDemo(),
  ),
  RowItem(
    name: "Point Line Chart",
    description: "Google Charts - Point Line Chart",
    routeName: PointLineChart.routeName,
    buildRoute: (BuildContext context) => PointLineChart.withSampleData(),
  ),
  RowItem(
    name: "Pull Refresh Load More",
    description: "Pull to refresh and load more at bottom",
    routeName: PullRefreshLoadMore.routeName,
    buildRoute: (BuildContext context) => PullRefreshLoadMore(),
  )
];

final kAllDemos = basicItems + uiItems + otherItems;

Widget createDemoList(BuildContext context, String title, List list) {
  return CupertinoPageScaffold(
    child: CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text(title + " - " + AppConfig.of(context).env),
          trailing: TextIcon(),
        ),
        SliverPadding(
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
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return OneRow(rowItem: list[index]);
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
    final Widget row = GestureDetector(
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
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, top: 8.0, bottom: 8.0, right: 8.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 60.0,
                width: 60.0,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(rowItem.name),
                      Padding(padding: const EdgeInsets.only(top: 8.0)),
                      Text(
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

    return Column(
      children: <Widget>[
        row,
        Container(
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[Icon(Icons.exit_to_app), Text("Exit")],
    );
  }
}
