import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'basic/basic.dart';
import 'ui/ui.dart';
import 'other/other.dart';
import 'demos.dart';
import 'model/all_models.dart';
import 'app_config.dart';

void main() {
  var appConfig = new AppConfig(
    appName: 'My App Dev',
    env: "Dev",
    child: new MyApp(),
  );
  runApp(appConfig);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> _kRoutes = <String, WidgetBuilder>{};
    for (RowItem item in kAllDemos) {
      // For a different example of how to set up an application routing table
      // using named routes, consider the example in the Navigator class documentation:
      // https://docs.flutter.io/flutter/widgets/Navigator-class.html
      _kRoutes[item.routeName] = (BuildContext context) {
        return item.buildRoute(context);
      };
    }
    var config = AppConfig.of(context);

    return new MaterialApp(
        title: config.appName,
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage(),
        routes: _kRoutes);
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoTabScaffold(
      tabBar: new CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
            title: const Text('Basic'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.conversation_bubble),
            title: const Text('UI'),
          ),
          const BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.profile_circled),
            title: const Text('Other'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return new DefaultTextStyle(
          style: const TextStyle(
            fontFamily: '.SF UI Text',
            fontSize: 17.0,
            color: CupertinoColors.black,
          ),
          child: new CupertinoTabView(
            builder: (BuildContext context) {
              switch (index) {
                case 0:
                  return new BasicDemo();
                  break;
                case 1:
                  return new UIDemo();
                  break;
                case 2:
                  return new OtherDemo();
                  break;
                default:
              }
            },
          ),
        );
      },
    );
  }
}
