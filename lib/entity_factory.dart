import 'package:wan/bean/banner_item_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerItemEntity") {
      return BannerItemEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}