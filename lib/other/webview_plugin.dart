import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatelessWidget {
  static const String routeName = '/webview_page';
  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        title: new Text('WebView Example'),
      ),
      url: "http://baidu.com",
      withJavascript: true, // enable js
      withLocalStorage: true, // enable Localstorage
      withZoom: false, // disable zoom
    );
  }
}
