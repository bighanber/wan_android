import 'package:flutter/material.dart';
import 'package:wan/bean/system_item_entity.dart';
import 'system_article_page.dart';

class SystemContent extends StatelessWidget {

  final List<SystemItemDatachild> dataList;

  const SystemContent({Key key, @required this.dataList}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: dataList.map<Widget>((SystemItemDatachild model) {
          return Padding(
            padding: EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SystemArticlePage(cid: model.id, title: model.name)));
              },
              child: Chip(
                label: Text(model.name, style: TextStyle(color: Colors.white),),
                backgroundColor: Color(0xFF68cbb2),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

