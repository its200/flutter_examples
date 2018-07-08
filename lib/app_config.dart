import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.env,
    @required Widget child,
  }) : super(child: child);

  final String appName;
  final String env;

  static AppConfig of(BuildContext context) {
    AppConfig appConfig = context.inheritFromWidgetOfExactType(AppConfig);
    assert(appConfig != null);
    return appConfig;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
