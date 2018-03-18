import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoBottomModal extends StatelessWidget {
  static const String routeName = '/cupertino_bottom_modal';

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