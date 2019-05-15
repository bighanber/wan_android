import 'package:flutter/material.dart';
import 'package:wan/bean/system_item_entity.dart';
import 'package:wan/ui/system/system_content_list_view.dart';

class SystemListView extends StatelessWidget {
  final List<SystemItemData> datas;

  const SystemListView({Key key, @required this.datas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          key: key,
          itemCount: datas.length,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: GestureDetector(
                child: _ListItem(data: datas[index]),
                onTap: () {},
              ),
            );
          }),
    );
  }
}

class _ListItem extends StatelessWidget {
  final SystemItemData data;

  const _ListItem({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data.name,style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),

          SystemContent(dataList: data.children),
        ],
      ),
    );
  }
}
