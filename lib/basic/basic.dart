import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const List<Color> coolColors = const <Color>[
  const Color.fromARGB(255, 255, 59, 48),
  const Color.fromARGB(255, 255, 149, 0),
  const Color.fromARGB(255, 255, 204, 0),
  const Color.fromARGB(255, 76, 217, 100),
  const Color.fromARGB(255, 90, 200, 250),
  const Color.fromARGB(255, 0, 122, 255),
  const Color.fromARGB(255, 88, 86, 214),
  const Color.fromARGB(255, 255, 45, 85),
];

const List<String> coolColorNames = const <String>[
  'Sarcoline', 'Coquelicot', 'Smaragdine', 'Mikado', 'Glaucous', 'Wenge',
  'Fulvous', 'Xanadu', 'Falu', 'Eburnean', 'Amaranth', 'Australien',
  'Banan', 'Falu', 'Gingerline', 'Incarnadine', 'Labrador', 'Nattier',
  'Pervenche', 'Sinoper', 'Verditer', 'Watchet', 'Zaffre',
];

class BasicDemo extends StatelessWidget {
  final List<Color> colorItems = new List<Color>.generate(50, (int index) {
    return coolColors[new math.Random().nextInt(coolColors.length)];
  });
  final List<String> colorNameItems = new List<String>.generate(
      50, (int index) {
    return coolColorNames[new math.Random().nextInt(coolColorNames.length)];
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: new CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Colors'),
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
                    lastItem: index == 49,
                    color: colorItems[index],
                    colorName: colorNameItems[index],
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
  const Tab1RowItem({this.index, this.lastItem, this.color, this.colorName});

  final int index;
  final bool lastItem;
  final Color color;
  final String colorName;

  @override
  Widget build(BuildContext context) {
    final Widget row = new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(new CupertinoPageRoute<Null>(
          builder: (BuildContext context) =>
          new Tab1ItemPage(
            color: color,
            colorName: colorName,
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
                decoration: new BoxDecoration(
                  color: color,
                  borderRadius: new BorderRadius.circular(8.0),
                ),
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(colorName),
                      const Padding(padding: const EdgeInsets.only(top: 8.0)),
                      const Text(
                        'Buy this cool color',
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

    if (lastItem) {
      return row;
    }

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

class Tab1ItemPage extends StatefulWidget {
  const Tab1ItemPage({this.color, this.colorName, this.index});

  final Color color;
  final String colorName;
  final int index;

  @override
  State<StatefulWidget> createState() => new Tab1ItemPageState();
}

class Tab1ItemPageState extends State<Tab1ItemPage> {
  @override
  void initState() {
    super.initState();
    relatedColors = new List<Color>.generate(10, (int index) {
      final math.Random random = new math.Random();
      return new Color.fromARGB(
        255,
        (widget.color.red + random.nextInt(100) - 50).clamp(0, 255),
        (widget.color.green + random.nextInt(100) - 50).clamp(0, 255),
        (widget.color.blue + random.nextInt(100) - 50).clamp(0, 255),
      );
    });
  }

  List<Color> relatedColors;

  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        middle: new Text(widget.colorName),
        trailing: const ExitButton(),
      ),
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new ListView(
          children: <Widget>[
            const Padding(padding: const EdgeInsets.only(top: 16.0)),
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Container(
                    height: 128.0,
                    width: 128.0,
                    decoration: new BoxDecoration(
                      color: widget.color,
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                  ),
                  const Padding(padding: const EdgeInsets.only(left: 18.0)),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          widget.colorName,
                          style: const TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        const Padding(padding: const EdgeInsets.only(top: 6.0)),
                        new Text(
                          'Item number ${widget.index}',
                          style: const TextStyle(
                            color: const Color(0xFF8E8E93),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const Padding(
                            padding: const EdgeInsets.only(top: 20.0)),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new CupertinoButton(
                              color: CupertinoColors.activeBlue,
                              minSize: 30.0,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0),
                              borderRadius: new BorderRadius.circular(32.0),
                              child: const Text(
                                'GET',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.28,
                                ),
                              ),
                              onPressed: () {},
                            ),
                            new CupertinoButton(
                              color: CupertinoColors.activeBlue,
                              minSize: 30.0,
                              padding: EdgeInsets.zero,
                              borderRadius: new BorderRadius.circular(32.0),
                              child: const Icon(CupertinoIcons.ellipsis,
                                  color: CupertinoColors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 28.0, bottom: 8.0),
              child: const Text(
                'USERS ALSO LIKED',
                style: const TextStyle(
                  color: const Color(0xFF646464),
                  letterSpacing: -0.60,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            new SizedBox(
              height: 200.0,
              child: new ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemExtent: 160.0,
                itemBuilder: (BuildContext context, int index) {
                  return new Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: new Container(
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(8.0),
                        color: relatedColors[index],
                      ),
                      child: new Center(
                        child: new CupertinoButton(
                          child: const Icon(
                            CupertinoIcons.plus_circled,
                            color: CupertinoColors.white,
                            size: 36.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
