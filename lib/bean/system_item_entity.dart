class SystemItemEntity {
	List<SystemItemData> data;
	int errorCode;
	String errorMsg;

	SystemItemEntity({this.data, this.errorCode, this.errorMsg});

	SystemItemEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<SystemItemData>();(json['data'] as List).forEach((v) { data.add(new SystemItemData.fromJson(v)); });
		}
		errorCode = json['errorCode'];
		errorMsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['errorCode'] = this.errorCode;
		data['errorMsg'] = this.errorMsg;
		return data;
	}
}

class SystemItemData {
	int visible;
	List<SystemItemDatachild> children;
	String name;
	bool userControlSetTop;
	int id;
	int courseId;
	int parentChapterId;
	int order;

	SystemItemData({this.visible, this.children, this.name, this.userControlSetTop, this.id, this.courseId, this.parentChapterId, this.order});

	SystemItemData.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		if (json['children'] != null) {
			children = new List<SystemItemDatachild>();(json['children'] as List).forEach((v) { children.add(new SystemItemDatachild.fromJson(v)); });
		}
		name = json['name'];
		userControlSetTop = json['userControlSetTop'];
		id = json['id'];
		courseId = json['courseId'];
		parentChapterId = json['parentChapterId'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		if (this.children != null) {
      data['children'] =  this.children.map((v) => v.toJson()).toList();
    }
		data['name'] = this.name;
		data['userControlSetTop'] = this.userControlSetTop;
		data['id'] = this.id;
		data['courseId'] = this.courseId;
		data['parentChapterId'] = this.parentChapterId;
		data['order'] = this.order;
		return data;
	}
}

class SystemItemDatachild {
	int visible;
	List<Null> children;
	String name;
	bool userControlSetTop;
	int id;
	int courseId;
	int parentChapterId;
	int order;

	SystemItemDatachild({this.visible, this.children, this.name, this.userControlSetTop, this.id, this.courseId, this.parentChapterId, this.order});

	SystemItemDatachild.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		if (json['children'] != null) {
			children = new List<Null>();
		}
		name = json['name'];
		userControlSetTop = json['userControlSetTop'];
		id = json['id'];
		courseId = json['courseId'];
		parentChapterId = json['parentChapterId'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		if (this.children != null) {
      data['children'] =  [];
    }
		data['name'] = this.name;
		data['userControlSetTop'] = this.userControlSetTop;
		data['id'] = this.id;
		data['courseId'] = this.courseId;
		data['parentChapterId'] = this.parentChapterId;
		data['order'] = this.order;
		return data;
	}
}
