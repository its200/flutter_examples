import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class OverscrollHttp extends StatefulWidget {
  static const String routeName = '/overscroll_http';

  @override
  OverscrollHttpState createState()  => OverscrollHttpState();
}

class OverscrollHttpState extends State<OverscrollHttp> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
        _refreshIndicatorKey.currentState?.show();
      });
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
  String _title = "";
  String _subTitle = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _getIPAddress,
        child: ListView(
        children: <Widget>[
          ListTile(title: Text(_title),subtitle: Text(_subTitle),)
        ],)
      )
    );
  }

  Future<Null> _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var jsonStr = await response.transform(utf8.decoder).join();
        var data = json.decode(jsonStr);
        result = data['origin'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _title = result;
      _subTitle = DateTime.now().toString();
    });
  }
}