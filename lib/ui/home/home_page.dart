import 'package:flutter/material.dart';
import 'package:wan/http/http_export.dart';
import 'package:wan/bean/banner_item_entity.dart';
import 'dart:io';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<BannerItemData> bannerList;

  void request() async {
    var result = await HttpManager().get(Api.getBanner, null);
    var data = json.decode(result.toString());
    var entity = new BannerItemEntity.fromJson(data);
    bannerList = entity.data;
    setState(() {

    });
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
        child: Text('net-home'),
      );
    }
  }
}
