import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  static const String routeName = '/layout';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Layout Demos",
      home: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.chevron_left),
            alignment: Alignment.centerLeft,
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Layout Demos"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Basic Layout"),
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(builder: (context) => BasicLayout()));
              },
            ),
            new Divider(),
          ],
        ),
      ),
    );
  }
}

class BasicLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text("Church of the Good Shepherd"),
                ),
                Text("Lake Tekapo, New Zealand",
                    style: TextStyle(color: Colors.grey[500]),)
              ],
            ),
          ),
          FavoriteWidget()
        ],
      ),
    );
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(Icons.call, "Call"),
          _buildButtonColumn(Icons.near_me, "Route"),
          _buildButtonColumn(Icons.share, "Share")
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        '''
        Lake Tekapo is the second-largest of three roughly parallel lakes running north–south along the northern edge of the Mackenzie Basin in the South Island of New Zealand (the others are Lake Pukaki and Lake Ohau). It covers an area of 83 square kilometres (32 sq mi), and is at an altitude of 710 metres (2,330 ft) above sea level.
        ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Image.asset(
              "assets/images/lake-tekapo.jpg",
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Widget _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.blue,),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.blue,
            ),),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<StatefulWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 99;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red,
            onPressed: _toggleFavorited,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Text("$_favoriteCount"),
        )
      ],
    );
  }

  _toggleFavorited() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}