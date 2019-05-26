class Api {
  static const String Host = "https://www.wanandroid.com/";

  static const String MusicHost = "https://www.mxnzp.com/api/";

  static const String getBanner = "${Host}banner/json";

  static String getHomeData(int page) {
    return "${Host}article/list/$page/json";
  }

  static const getSystemList = "${Host}tree/json";

  static getSystemContent(int page, int cid) {
    return "${Host}article/list/$page/json?cid=$cid";
  }


  //音乐相关API

  //每日推荐
  static const getRecommendSongList = "${MusicHost}music/recommend/list";

  //榜单
  static const getRankList = "${MusicHost}music/order/list";

  //指定榜单的歌曲列表 - param: type, page
  static const getRankSongList = "${MusicHost}music/order/song/list";

  //搜索歌曲 - param: keyWord
  static const searchSong = "${MusicHost}music/song/search";

  //获取歌曲详情 - param: songId
  static const getSongDetail = "${MusicHost}music/song/detail";

  //搜索歌手 - param: keyWord
  static const searchSinger = "${MusicHost}music/singer/search";

  //获取歌手详情 - param: singerId
  static const getSingerDetail = "${MusicHost}music/singer/detail";

  //获取歌手所有的歌曲列表 - param: singerId, page
  static const getSingerSongList = "${MusicHost}music/singer/song/list";

}