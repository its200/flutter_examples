import 'model/all_models.dart';
import 'all_demos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:flutter/cupertino.dart';

final List<RowItem> basicItems = <RowItem> [
  RowItem(
    name: "Hello World",
    description: "First Demo",
    routeName: HelloWorld.routeName,
    buildRoute: (BuildContext context) => HelloWorld(),
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
];

final List<RowItem> uiItems = <RowItem> [
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
];

final List<RowItem> otherItems = <RowItem> [
];

final kAllDemos = basicItems + uiItems + otherItems;

Widget createDemoList(BuildContext context, String title, List list) {

  return CupertinoPageScaffold(
    child: new CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
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
                return new OneRow(
                    rowItem: list[index]
                );
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
          Navigator.of(context, rootNavigator: true).pushNamed(rowItem.routeName);
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
                child: Icon(Icons.favorite, color: Colors.red,),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(rowItem.name),
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.exit_to_app),
        Text("Exit")
      ],
    );
  }

}