class Api {
  static const String Host = "https://www.wanandroid.com/";

  static const String getBanner = "${Host}banner/json";

  static String getHomeData(int page) {
    return "${Host}article/list/$page/json";
  }

  static const getSystemList = "${Host}tree/json";

  static getSystemContent(int page, int cid) {
    return "${Host}article/list/$page/json?cid=$cid";
  }
}