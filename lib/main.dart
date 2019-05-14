import 'package:flutter/material.dart';
import 'package:wan/ui/home/home_page.dart';
import 'package:wan/ui/system/system_page.dart';
import 'package:wan/ui/my/my_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'luu',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color(0xFF68cbb2),
        primaryColorBrightness: Brightness.dark
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _tabIndex = 0;
  var tabIcon;
  var tabTitle = ['首页', '体系', '我的'];
  var _pageList;

  Image getTabImage(String path) {
    return Image.asset(path, width: 24.0, height: 24.0);
  }

  Image getTabIcon(int cur) {
    if (cur == _tabIndex) {
      return tabIcon[cur][1];
    } else {
      return tabIcon[cur][0];
    }
  }

  Text getTabTitle(int cur) {
    if (cur == _tabIndex) {
      return Text(tabTitle[cur], style: TextStyle(fontSize: 12.0, color: Color(0xFF68cbb2)),);
    } else {
      return Text(tabTitle[cur], style: TextStyle(fontSize: 12.0),);
    }
  }

  void initData() {
    tabIcon = [
      [getTabImage('images/home.png'), getTabImage('images/home_select.png')],
      [getTabImage('images/tixi.png'), getTabImage('images/tixi_select.png')],
      [getTabImage('images/my.png'), getTabImage('images/my_select.png')],
    ];

    _pageList = [
      HomePage(),
      SystemPage(),
      MyPage()
    ];
  }

  Widget _getPage(int index) {
    return Offstage(
      offstage: _tabIndex != index,
      child: TickerMode(
          enabled: _tabIndex == index,
        child: _pageList[index],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _getPage(0),
          _getPage(1),
          _getPage(2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2))
          ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}



