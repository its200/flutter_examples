import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RowItem {
  const RowItem({
    @required this.name,
    this.description,
    @required this.routeName,
    @required this.buildRoute,
  });

  final String name;
  final String description;
  final String routeName;
  final WidgetBuilder buildRoute;
}