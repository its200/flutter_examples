import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UIDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: new CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('UI Demos'),
            trailing: ExitButton(),
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
                  return new Tab1RowItem(
                    index: index,
                  );
                },
                childCount: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Tab1RowItem extends StatelessWidget {
  const Tab1RowItem({this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final Widget row = new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(new CupertinoPageRoute<Null>(
          builder: (BuildContext context) =>
          new Tab1ItemPage(
            index: index,
          ),
        ));
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
                      new Text("Hello World"),
                      const Padding(padding: const EdgeInsets.only(top: 8.0)),
                      const Text(
                        'Do you like this?',
                        style: const TextStyle(
                          color: const Color(0xFF8E8E93),
                          fontSize: 13.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.plus_circled,
                  color: CupertinoColors.activeBlue,
                  semanticLabel: 'Add',
                ),
                onPressed: () {},
              ),
              new CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.share,
                  color: CupertinoColors.activeBlue,
                  semanticLabel: 'Share',
                ),
                onPressed: () {},
              ),
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

class Tab1ItemPage extends StatelessWidget {
  const Tab1ItemPage({this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text("Hello Flutter"),
            trailing: IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                showModalBottomSheet<Null>(context: context, builder: (BuildContext context) {
                  return new Container(
                      height: 180.0,
                      child: new Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Text("Hello World"),
                                onTap: () {
                                  showDemoDialog<String>(
                                    context: context,
                                    child: new CupertinoAlertDialog(
                                        content: const Text('Discard draft?'),
                                        actions: <Widget>[
                                          new CupertinoDialogAction(
                                              child: const Text('Discard'),
                                              isDestructiveAction: true,
                                              onPressed: () { Navigator.pop(context, 'Discard'); }
                                          ),
                                          new CupertinoDialogAction(
                                              child: const Text('Cancel'),
                                              isDefaultAction: true,
                                              onPressed: () { Navigator.pop(context, 'Cancel'); }
                                          ),
                                        ]
                                    ),
                                  );
                                },
                              ),
                              ListTile(
                                title: Text("Hello Again"),
                                onTap: () {
                                  showDemoDialog<String>(
                                    context: context,
                                    child: new CupertinoAlertDialog(
                                        content: const Text('Discard draft?'),
                                        actions: <Widget>[
                                          new CupertinoDialogAction(
                                              child: const Text('Confirm'),
                                              isDestructiveAction: true,
                                              onPressed: () { Navigator.pop(context, 'Discard'); }
                                          ),
                                          new CupertinoDialogAction(
                                              child: const Text('Cancel'),
                                              isDefaultAction: true,
                                              onPressed: () { Navigator.pop(context, 'Cancel'); }
                                          ),
                                        ]
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                      )
                  );
                });
              },),
          ),
          child: Center(child: Text("Hello World"),)),
    );
  }

  void showDemoDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      child: child,
      barrierDismissible: false,
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton();

  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      padding: EdgeInsets.zero,
      child: const Text('Exit') ,
      onPressed: () {
        // The demo is on the root navigator.
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
  }
}
class TextIcon extends StatelessWidget {
  const TextIcon();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text("Exit"),
        Icon(Icons.exit_to_app)
      ],
    );
  }

}
