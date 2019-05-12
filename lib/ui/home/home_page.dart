import 'package:flutter/material.dart';
import 'package:wan/http/http_export.dart';
import 'package:wan/bean/banner_item_entity.dart';
import 'dart:convert';
import 'home_banner.dart';
import 'package:wan/entity_factory.dart';
import 'package:wan/bean/home_item_entity.dart';
import 'home_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerItemData> bannerList;
  HomeItemData homeData;

  void request() async {
    var manager = HttpManager();
    var result = await manager.get(Api.getBanner, null);
    var homeResult = await manager.get(Api.getHomeData(0), null);
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
    request();
  }

  @override
  Widget build(BuildContext context) {
    if (bannerList == null) {
      return Container(
        child: Text('home'),
      );
    } else {
      return Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('u'),
              pinned: true,
              backgroundColor: Color(0xFF68cbb2),
              expandedHeight: MediaQuery.of(context).size.width * 0.6,
              flexibleSpace: FlexibleSpaceBar(
                background: HomeBanner(banners: bannerList),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((builder, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: GestureDetector(
                    child: _ListItem(data: homeData.datas[index]),
                    onTap: () {

                    },
                  ),
                );
              },
                childCount: homeData.datas.length
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _ListItem extends StatelessWidget {

  final HomeItemDataData data;

  const _ListItem({Key key, @required this.data}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(data.title),

          Text(data.author),

          Text(data.niceDate)
        ],
      ),
    );
  }
}
