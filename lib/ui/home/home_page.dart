import 'package:flutter/material.dart';
import 'package:wan/http/http_export.dart';
import 'package:wan/bean/banner_item_entity.dart';
import 'dart:convert';
import 'home_banner.dart';
import 'package:wan/entity_factory.dart';
import 'package:wan/bean/home_item_entity.dart';
import 'home_list_view.dart';
import 'dart:async';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart' as extend;
import 'package:loading_more_list/loading_more_list.dart';
import 'package:wan/repository/home_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerItemData> bannerList;
  HomeItemData homeData;

  HomeRepository home;

  request(int page) async {
    var manager = HttpManager();
    var result = await manager.get(Api.getBanner, null);
    var homeResult = await manager.get(Api.getHomeData(page), null);
    var data = json.decode(result.toString());
    var home = json.decode(homeResult.toString());
    var entity = EntityFactory.generateOBJ<BannerItemEntity>(data);
    var homeEntity = EntityFactory.generateOBJ<HomeItemEntity>(home);
    bannerList = entity.data;
    homeData = homeEntity.data;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    request(0);
    home = HomeRepository();
  }


  @override
  void dispose() {
  super.dispose();
  home.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (bannerList == null) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xFF68cbb2)),
        ),
      );
    } else {
      return Container(
        child: extend.NestedScrollViewRefreshIndicator(
          child: NestedScrollView(
              headerSliverBuilder: (c, f) {
                return <Widget>[
                  SliverAppBar(
                    title: Text(''),
                    pinned: true,
                    backgroundColor: Color(0xFF68cbb2),
                    expandedHeight: MediaQuery.of(context).size.width * 0.6,
                    flexibleSpace: FlexibleSpaceBar(
                      background: HomeBanner(banners: bannerList),
                    ),
                  ),
                ];
              },
              body: LoadingMoreCustomScrollView(
                showGlowLeading: false,
                showGlowTrailing: false,
                rebuildCustomScrollView: true,
                slivers: <Widget>[
                  LoadingMoreSliverList(SliverListConfig<HomeItemDataData>(
                    itemBuilder: (context, item, index) {
                      return _ListItem(data: item);
                    },
                    sourceList: home,
                  ))
                ],
              ),
          ),
            onRefresh: onRefresh),
      );
    }
  }

  Future<bool> onRefresh() async {
    return await home.refresh(true);
  }
}



class _ListItem extends StatelessWidget {

  final HomeItemDataData data;

  const _ListItem({Key key, @required this.data}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(data.title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black45),),

            SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(data.author),
                Text(data.niceDate)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
