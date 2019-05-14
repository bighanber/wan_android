import 'package:loading_more_list/loading_more_list.dart';
import 'package:wan/http/http_export.dart';
import 'package:wan/bean/home_item_entity.dart';
import 'dart:async';
import 'package:wan/entity_factory.dart';
import 'dart:convert';

class HomeRepository extends LoadingMoreBase<HomeItemDataData> {

  int page = 0;

  @override
  bool _hasMore = true;
  bool forceRefresh = false;

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {

    var manager = HttpManager();
    var homeResult = await manager.get(Api.getHomeData(page), null);
    var home = json.decode(homeResult.toString());
    var homeEntity = EntityFactory.generateOBJ<HomeItemEntity>(home);
    this.addAll(homeEntity.data.datas);
    _hasMore = homeEntity.data.datas.isNotEmpty;
    page++;
    return true;
  }

  //super.refresh最终也会调用到loadData方法。
  @override
  Future<bool> refresh([bool notifyStateChanged = false]) async {
    _hasMore = true;
    page = 0;
    var result = await super.refresh(true);
    forceRefresh = false;
    return result;
  }
}