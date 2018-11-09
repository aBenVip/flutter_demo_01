import 'package:flutter/material.dart';
import 'package:flutter_demo_01/src/art/ArtPage.dart';
import 'package:flutter_demo_01/src/home/HomePage.dart';
import 'package:flutter_demo_01/src/mine/MinePage.dart';
import 'package:flutter_demo_01/src/online/OnlinePage.dart';
import 'package:flutter_demo_01/src/price/PricePage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainPageWidget();
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPageWidget> {
  int _currentIndex = 0;
  var _bodyWidget = [
    new HomePage(),
    new OnlinePage(),
    new PricePage(),
    new ArtPage(),
    new MinePage(),
  ];

  var _tabTexts = ["藏友圈", "在线拍", "一口价", "艺术店", "我的"];

  var _tabImages = [
    ["image/tab_home_nor.png", "image/tab_home_sel.png"],
    ["image/tab_auction_nor.png", "image/tab_auction_sel.png"],
    ["image/tab_price_nor.png", "image/tab_price_sel.png"],
    ["image/tab_shop_nor.png", "image/tab_shop_sel.png"],
    ["image/tab_personal_nor.png", "image/tab_personal_sel.png"]
  ];

  Image _getImage(index) {
    if (index == _currentIndex) {
      return Image.asset(
        _tabImages[index][1],
        width: 20,
        height: 20,
      );
    } else {
      return Image.asset(
        _tabImages[index][0],
        width: 20,
        height: 20,
      );
    }
  }

  Text _getText(index) {
    if (index == _currentIndex) {
      return Text(_tabTexts[index], style: TextStyle(color: Colors.red));
    } else {
      return Text(_tabTexts[index], style: TextStyle(color: Colors.grey));
    }
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(index) {
    return BottomNavigationBarItem(
        icon: _getImage(index), title: _getText(index));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: _bodyWidget[_currentIndex],
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _getBottomNavigationBarItem(0),
            _getBottomNavigationBarItem(1),
            _getBottomNavigationBarItem(2),
            _getBottomNavigationBarItem(3),
            _getBottomNavigationBarItem(4),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              print(_currentIndex);
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
