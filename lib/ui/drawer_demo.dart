import 'package:flutter/material.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class DrawerDemo extends StatefulWidget {
  static const String routeName = '/drawer_demo';

  final drawerItems = [
    DrawerItem("Home", Icons.home),
    DrawerItem("UI", Icons.dashboard),
    DrawerItem("Library", Icons.beach_access),
    DrawerItem("Log out", Icons.near_me)
  ];

  @override
  DrawerDemoState createState() => DrawerDemoState();
}

class DrawerDemoState extends State<DrawerDemo> {
  int _selectedDrawerIndex = 0;
  bool isAnotherView = false;

  _getDrawerItemWidget(int pos, bool isAnotherView) {
    switch (pos) {
      case 0:
        return HomeFragment();
      case 1:
        return UIFragment(isAnotherView: isAnotherView);
      case 2:
        return LibFragment();

      default:
        return Center(
          child: Text("Page Not Found"),
        );
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
      if (i == 2) {
        drawerOptions.add(Divider());
      }
    }

    return new Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        actions: _buildActions(),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: new Text("Hello World"), accountEmail: null),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex, isAnotherView),
    );
  }

  List<Widget> _buildActions() {
    List<Widget> list = <Widget>[];
    if (_selectedDrawerIndex == 1) {
      list.add(
        IconButton(
          icon: isAnotherView ? Icon(Icons.swap_horiz) : Icon(Icons.swap_vert),
          onPressed: () {
            setState(() {
              isAnotherView = !isAnotherView;
            });
          },
        ),
      );
    }
    return list;
  }
}

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home"),
    );
  }
}

class UIFragment extends StatelessWidget {
  UIFragment({@required this.isAnotherView});

  final bool isAnotherView;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(isAnotherView ? "Another UI" : "UI"),
    );
  }
}

class LibFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Library"),
    );
  }
}
