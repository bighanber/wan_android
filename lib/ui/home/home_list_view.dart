import 'package:flutter/material.dart';
import 'package:wan/bean/home_item_entity.dart';

class HomeListView extends StatelessWidget {
  final List<HomeItemDataData> datas;

  const HomeListView({Key key, @required this.datas}) : super(key: key);

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
  final HomeItemDataData data;

  const _ListItem({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Column(
        children: <Widget>[
          Text(data.title),
          Text(data.author),
          Text(data.niceDate)
        ],
      ),
    );
  }
}
