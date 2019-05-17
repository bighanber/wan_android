import 'package:flutter/material.dart';
import 'package:wan/bean/system_content_item_entity.dart';
import 'package:wan/repository/api_client.dart';
import 'package:wan/ui/web/web_detail.dart';

class SystemArticlePage extends StatefulWidget {

  final int cid;
  final String title;

  const SystemArticlePage({Key key, @required this.cid, @required this.title}) : super(key : key);

  @override
  _SystemArticlePageState createState() => _SystemArticlePageState();
}

class _SystemArticlePageState extends State<SystemArticlePage> {

//  SystemContentItemEntity articleData;
  List<SystemContentItemDataData> articleList = new List();
  ScrollController _controller;
  int page = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _refresh();

    _controller = new ScrollController();
    _controller.addListener(() {
      if(_controller.position.pixels == _controller.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: articleList == null || articleList.isEmpty ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xFF68cbb2)),
        ),
      ) : RefreshIndicator(
          child: ListView.builder(
              key: widget.key,
              itemCount: articleList.length + 1,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              controller: _controller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: GestureDetector(
                    child: index < articleList.length ? _ListItem(data: articleList[index]) : _getMoreWidget(isLoading),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WebDetail(url: articleList[index].link)));
                    },
                  ),
                );
              }),
          onRefresh: _refresh),
    );
  }

  Future<Null> _refresh() async {
    articleList.clear();
    page = 0;
    print("refresh");
    ApiClient().getSystemContent(page, widget.cid).then((res) {
      setState(() {
        articleList.addAll(res.data.datas);
      });
    });
    return;
  }

  _loadMore() async {
    print("loadmore");
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      page++;


      ApiClient().getSystemContent(page, widget.cid).then((res) {

//        if (res.data.datas.isEmpty) {
//          double edge = 30.0;
//          double offsetFromBottom = _controller.position.maxScrollExtent - _controller.position.pixels;
//          if (offsetFromBottom < edge) {
//            _controller.animateTo(
//                _controller.offset - (edge -offsetFromBottom),
//                duration: new Duration(milliseconds: 500),
//                curve: Curves.easeOut);
//          }
//        }

        setState(() {
            articleList.addAll(res.data.datas);
          isLoading = false;
        });
      });
    }
  }
}

Widget _getMoreWidget(bool isLoading) {
  print(isLoading);
  return Offstage(
    offstage: isLoading,
    child: Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Color(0xFF68cbb2)),
      ),
    ),
  );
}

class _ListItem extends StatelessWidget {
  final SystemContentItemDataData data;

  const _ListItem({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black45),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text(data.author), Text(data.niceDate)],
          ),
        ],
      ),
    );
  }
}
