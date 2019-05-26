import 'package:wan/http/http_export.dart';
import 'package:wan/bean/banner_item_entity.dart';
import 'package:wan/bean/system_item_entity.dart';
import 'package:wan/bean/system_content_item_entity.dart';
import 'package:wan/bean/recommend_song_item_entity.dart';
import 'package:wan/bean/song_detail_item_entity.dart';
import 'dart:async';
import 'package:wan/entity_factory.dart';
import 'dart:convert';

class ApiClient {

  var manager = HttpManager();

  Future<BannerItemEntity> getBanner() async {
    var result = await manager.get(Api.getBanner, null);
    var data = json.decode(result.toString());
    var entity = EntityFactory.generateOBJ<BannerItemEntity>(data);
    return entity;
  }

  Future<SystemItemEntity> getSystem() async {
    var result = await manager.get(Api.getSystemList, null);
    var data = json.decode(result.toString());
    var entity = EntityFactory.generateOBJ<SystemItemEntity>(data);
    return entity;
  }

  Future<SystemContentItemEntity> getSystemContent(int page, int cid) async {
    var result = await manager.get(Api.getSystemContent(page, cid), null);
    var data = json.decode(result.toString());
    var entity = EntityFactory.generateOBJ<SystemContentItemEntity>(data);
    return entity;
  }

  Future<RecommendSongItemEntity> getRecommendSong() async {
    var result = await manager.get(Api.getRecommendSongList, null);
    var data = json.decode(result.toString());
    var entity = EntityFactory.generateOBJ<RecommendSongItemEntity>(data);
    return entity;
  }

  Future<SongDetailItemEntity> getSongDetail(String id) async {
    var result = await manager.get(Api.getSongDetail, {"songId": id});
    var data = json.decode(result.toString());
    var entity = EntityFactory.generateOBJ<SongDetailItemEntity>(data);
    return entity;
  }
}