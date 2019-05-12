import 'package:flutter/material.dart';
import 'package:wan/bean/banner_item_entity.dart';

class HomeBanner extends StatefulWidget {

  final List<BannerItemData> banners;

  const HomeBanner({Key key, @required this.banners}) : super(key : key);

  @override
  _HomeBannerState createState() => _HomeBannerState(this.banners);
}

class _HomeBannerState extends State<HomeBanner> {

  final List<BannerItemData> banners;
  int _cur = 0;

  _HomeBannerState(this.banners);

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var _controller = PageController(initialPage: _cur);
    return Container(
      child: PageView.builder(
        key: PageStorageKey(context),
          itemCount: banners.length,
          controller: _controller,
          itemBuilder: (context, index) {
            return _BannerItemView(data: banners[index], totalPage: banners.length, curPage: index);
          },
        onPageChanged: (page) {
          setState(() {
            _cur = page;
          });
        },
      ),
    );
  }
}

class _BannerItemView extends StatelessWidget {
  
  final BannerItemData data;
  final int totalPage;
  final int curPage;
  
  const _BannerItemView({Key key, @required this.data, @required this.totalPage, @required this.curPage}) : super(key : key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(data.imagePath, fit: BoxFit.cover),
          ),

        ],
      ),
    ); 
  }
}

