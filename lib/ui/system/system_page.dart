import 'package:flutter/material.dart';
import 'package:wan/ui/system/system_list_view.dart';
import 'package:wan/bean/system_item_entity.dart';
import 'package:wan/repository/api_client.dart';

class SystemPage extends StatefulWidget {
  @override
  _SystemPageState createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {

  List<SystemItemData> systemData;

  @override
  void initState() {
    super.initState();
    ApiClient().getSystem().then((res) {
      setState(() {
        systemData = res.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("体系"),
      ),
      body: systemData == null ?  Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Color(0xFF68cbb2)),
        ),
      ) : SystemListView(datas: systemData,),
    );
  }


}
