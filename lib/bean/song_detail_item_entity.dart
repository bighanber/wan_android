class SongDetailItemEntity {
	String msg;
	int code;
	SongDetailItemData data;

	SongDetailItemEntity({this.msg, this.code, this.data});

	SongDetailItemEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		code = json['code'];
		data = json['data'] != null ? new SongDetailItemData.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['code'] = this.code;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		return data;
	}
}

class SongDetailItemData {
	String songName;
	String songLink;
	String albumName;
	String songPic;
	int size;
	int rate;
	String lrcLink;
	String format;
	String artistName;
	int time;

	SongDetailItemData({this.songName, this.songLink, this.albumName, this.songPic, this.size, this.rate, this.lrcLink, this.format, this.artistName, this.time});

	SongDetailItemData.fromJson(Map<String, dynamic> json) {
		songName = json['songName'];
		songLink = json['songLink'];
		albumName = json['albumName'];
		songPic = json['songPic'];
		size = json['size'];
		rate = json['rate'];
		lrcLink = json['lrcLink'];
		format = json['format'];
		artistName = json['artistName'];
		time = json['time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['songName'] = this.songName;
		data['songLink'] = this.songLink;
		data['albumName'] = this.albumName;
		data['songPic'] = this.songPic;
		data['size'] = this.size;
		data['rate'] = this.rate;
		data['lrcLink'] = this.lrcLink;
		data['format'] = this.format;
		data['artistName'] = this.artistName;
		data['time'] = this.time;
		return data;
	}
}
