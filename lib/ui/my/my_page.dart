import 'package:flutter/material.dart';
import 'package:wan/ui/music/recommend_song_page.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[

                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecommendSong()));
                    },
                    child: _buildItem(title: "每日推荐", isLeft: true),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {

                    },
                    child: _buildItem(title: "榜单", isLeft: false),
                  ),
                ),


              ],
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {

                    },
                    child: _buildItem(title: "搜索歌曲", isLeft: true),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {

                    },
                    child: _buildItem(title: "搜索歌手", isLeft: false),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem({String title, bool isLeft}) {
    return Container(
        height: MediaQuery.of(context).size.width / 2,
        margin: isLeft ? EdgeInsets.only(top: 10.0, left: 10.0, right: 5.0) : EdgeInsets.only(top: 10.0, left: 5.0, right: 10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Theme.of(context).primaryColor]
            ),
            boxShadow: [BoxShadow(
              color: Colors.black45,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
            )]
        ),
        child: Center(
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 17.0),),
        ),
    );
  }
}
