class RecommendSongItemEntity {
	String msg;
	int code;
	List<RecommendSongItemData> data;

	RecommendSongItemEntity({this.msg, this.code, this.data});

	RecommendSongItemEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		if (json['data'] != null) {
			data = new List<RecommendSongItemData>();(json['data'] as List).forEach((v) { data.add(new RecommendSongItemData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class RecommendSongItemData {
	String siProxycompany;
	String author;
	String language;
	String picSmall;
	String title;
	String picHuge;
	String picBig;
	String songId;
	String publishtime;
	String picPremium;
	String tingUid;
	String picSinger;
	String info;
	String albumTitle;

	RecommendSongItemData({this.siProxycompany, this.author, this.language, this.picSmall, this.title, this.picHuge, this.picBig, this.songId, this.publishtime, this.picPremium, this.tingUid, this.picSinger, this.info, this.albumTitle});

	RecommendSongItemData.fromJson(Map<String, dynamic> json) {
		siProxycompany = json['si_proxycompany'];
		author = json['author'];
		language = json['language'];
		picSmall = json['pic_small'];
		title = json['title'];
		picHuge = json['pic_huge'];
		picBig = json['pic_big'];
		songId = json['song_id'];
		publishtime = json['publishtime'];
		picPremium = json['pic_premium'];
		tingUid = json['ting_uid'];
		picSinger = json['pic_singer'];
		info = json['info'];
		albumTitle = json['album_title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['si_proxycompany'] = this.siProxycompany;
		data['author'] = this.author;
		data['language'] = this.language;
		data['pic_small'] = this.picSmall;
		data['title'] = this.title;
		data['pic_huge'] = this.picHuge;
		data['pic_big'] = this.picBig;
		data['song_id'] = this.songId;
		data['publishtime'] = this.publishtime;
		data['pic_premium'] = this.picPremium;
		data['ting_uid'] = this.tingUid;
		data['pic_singer'] = this.picSinger;
		data['info'] = this.info;
		data['album_title'] = this.albumTitle;
		return data;
	}
}
