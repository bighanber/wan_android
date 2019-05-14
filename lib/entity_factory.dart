import 'package:wan/bean/system_item_entity.dart';
import 'package:wan/bean/home_item_entity.dart';
import 'package:wan/bean/banner_item_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "SystemItemEntity") {
      return SystemItemEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeItemEntity") {
      return HomeItemEntity.fromJson(json) as T;
    } else if (T.toString() == "BannerItemEntity") {
      return BannerItemEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}