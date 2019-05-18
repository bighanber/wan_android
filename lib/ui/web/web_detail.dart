import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebDetail extends StatefulWidget {

  final String url;

  const WebDetail({Key key, @required this.url}) : super(key : key);

  @override
  _WebDetailState createState() => _WebDetailState();
}

class _WebDetailState extends State<WebDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
