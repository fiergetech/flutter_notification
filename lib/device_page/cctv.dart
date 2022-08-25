import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CctvPage extends StatelessWidget {
  final String title;
  CctvPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebView(
        initialUrl: "http://192.168.43.238",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
