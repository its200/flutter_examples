import 'package:flutter/material.dart';

const padding = const Padding(padding: const EdgeInsets.only(top: 5.0));

class CustomList extends StatelessWidget {
  static const String routeName = '/custom_list';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shadow List'),
      ),
      body: Container(
          color: Colors.black12,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: new Column(
              children: [
                new Text(
                  "Hello World",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                new Expanded(
                  child: new ListView(
                    children: new List.filled(20, new Sheet())
                        .expand((sheet) => [padding, sheet])
                        .toList(),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class Sheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Material(
        elevation: 2.0,
        child: new ListTile(
          title: const Text('List Tile Title'),
          // Note commenting out both subtitle and trailing
          // 'fixes' the shadow issue - they render properly w/ scrolling.
          subtitle: const Text('List Tile Subtitle'),
          trailing: const ExpandIcon(),
        ),
      );
}
