import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../rate_people/index.dart';
import '../suggestions/index.dart';
import '../messaging/index.dart';
import '../leaderboard/index.dart';
import '../profile/index.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  PageController _pageController;
  List<int> pageHistory = List<int>();
  int _currentPage = 0;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          _onBackClick();
        },
        child: Scaffold(
            appBar: AppBar(
                leading: IconButton(
                    icon: Icon(Icons.photo_camera), onPressed: () {}),
                title: Text('Delmo'),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
                ]),
            body: PageView(controller: _pageController, children: <Widget>[
              RatePeople(),
              Suggestions(),
              Messaging(),
              Leaderboard(),
              Profile()
            ]),
            bottomNavigationBar: Container(
              height: 50.0,
                color: Colors.black.withAlpha(6),
                child: Column(children: <Widget>[
                  Container(height: 1.0,
                    color: Colors.black.withAlpha(7)),
                  Container(height: 1.0,
                    color: Colors.black.withAlpha(14)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _buildNavigationItem(Icons.rate_review, 0),
                        _buildNavigationItem(Icons.favorite, 1),
                        _buildNavigationItem(Icons.message, 2),
                        _buildNavigationItem(Icons.compare, 3),
                        _buildNavigationItem(Icons.person, 4)
                      ])
                ]))));
  }

  Widget _buildNavigationItem(IconData iconImage, int page) {
    Color pageColor = Theme.of(context).accentColor;
    double iconSize = 25.0;

    if (_currentPage == page) {
      pageColor = Theme.of(context).primaryColor;
      iconSize = 30.0;
    }

    return Container(
        child: IconButton(
            icon: Icon(iconImage, color: pageColor, size: iconSize),
            onPressed: () => _onPageClick(page)));
  }

  void _onPageClick(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.ease);

    pageHistory.add(page);

    setState(() {
      _currentPage = page;
    });
  }

  void _onBackClick() {
    int pageNum = 0;

    if (pageHistory.length > 0) {
      pageHistory.removeLast();

      if (pageHistory.length != 0) {
        pageNum = pageHistory[pageHistory.length - 1];
      }
    }

    _pageController.animateToPage(pageNum,
        duration: Duration(milliseconds: 300), curve: Curves.ease);

    setState(() {
      _currentPage = pageNum;
    });
  }
}
