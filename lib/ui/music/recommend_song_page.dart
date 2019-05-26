import 'package:flutter/material.dart';
import 'package:wan/bean/recommend_song_item_entity.dart';
import 'package:wan/repository/api_client.dart';
import 'package:wan/ui/music/music_play_page.dart';

class RecommendSong extends StatefulWidget {
  @override
  _RecommendSongState createState() => _RecommendSongState();
}

class _RecommendSongState extends State<RecommendSong> {
  List<RecommendSongItemData> dataList;

  @override
  void initState() {
    super.initState();
    ApiClient().getRecommendSong().then((res) {
      setState(() {
        dataList = res.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("每日推荐"),
      ),
      body: dataList == null
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xFF68cbb2)),
              ),
            )
          : _buildListView(data: dataList, context: context),
    );
  }

  Widget _buildListView(
      {List<RecommendSongItemData> data, BuildContext context}) {
    return ListView.builder(
        itemCount: data.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildListItem(model: data[index], context: context);
        });
  }

  Widget _buildListItem({RecommendSongItemData model, BuildContext context}) {
    return InkWell(
      onTap: () {
        ApiClient().getSongDetail(model.songId).then((res) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicPlay(detailData: res.data,)));
        });
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 50.0,
//              decoration: BoxDecoration(
//                shape: BoxShape.rectangle,
//                borderRadius: BorderRadius.circular(2.0),
//                image: DecorationImage(
//                  fit: BoxFit.fill,
//                    image: NetworkImage(model.picSmall),
//                ),
//              ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.network(model.picSmall),
                ),
              ),

              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[

                  Text(model.title * 2, maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text(model.author),
                ],
              )),

            ],
          ),
        ),
      ),
    );
  }
}
