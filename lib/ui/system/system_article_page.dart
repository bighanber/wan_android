import 'package:flutter/material.dart';
import 'package:wan/bean/system_content_item_entity.dart';

class SystemArticlePage extends StatefulWidget {

  final int cid;
  final String title;

  const SystemArticlePage({Key key, @required this.cid, @required this.title}) : super(key : key);

  @override
  _SystemArticlePageState createState() => _SystemArticlePageState();
}

class _SystemArticlePageState extends State<SystemArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("${widget.cid}"),
      ),
    );
  }
}
