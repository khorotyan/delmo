import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Messaging extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagingState();
  }
}

class _MessagingState extends State<Messaging> {
  static const double horizontalMargin = 14.0;

  final names = [
    'Kendall Jenner',
    'Emily Ratajkowski',
    'Cara Delevingne',
    'Sara Sampaio',
    'Adriana Lima',
    'Gigi Hadid',
    'Josephine Skriver',
    'Romee Strijd'
  ];
  final times = [
    'Nov 3',
    'Nov 1',
    'Oct 28',
    'Oct 28',
    'Oct 27',
    'Oct 24',
    'Oct 21',
    'Oct 20'
  ];
  final messages = [
    'You: Hey! how was the convert last night?',
    'Yeah, I\'ll let you know when I\'m around',
    'You: Hey cutie, how are you?',
    'I am totally into you ^_^',
    'Stop texting me you creep!',
    'Is your name Google? Because you have everything I’ve been searching for',
    'You: Hi, how was heaven when you left it?',
    'See ya soon ;)'
  ];
  final images = [
    'images/user1_profile1.jpg',
    'images/user2_profile1.jpg',
    'images/user3_profile1.jpg',
    'images/user4_profile1.jpg',
    'images/user5_profile1.jpg',
    'images/user6_profile1.jpg',
    'images/user7_profile1.jpg',
    'images/user8_profile1.jpg'
  ];
  final onlineStatuses = [false, true, false, true, false, false, false, true];

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildConversationsList(),
    );
  }

  Widget _buildConversationsList() {
    Widget conversations = Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Text('No conversations'),
          RaisedButton(
              child:
                  Text('Find matches', style: TextStyle(color: Colors.white)),
              onPressed: () {})
        ]));

    if (names.length > 0) {
      conversations = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _buildConversationItem(index),
        itemCount: names.length,
      );
    }

    return conversations;
  }

  Widget _buildConversationItem(int index) {
    return InkWell(
        child: Column(children: <Widget>[
          Container(
              height: 100.0,
              child: Stack(children: <Widget>[
                _buildTimeWidget(index),
                _buildConversationInfo(index)
              ])),
          Container(
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
            child: Divider(
            height: 2.0,
          ))
        ]),
        onTap: () {});
  }

  Widget _buildTimeWidget(int index) {
    return Container(
        alignment: Alignment.topRight,
        padding: EdgeInsets.only(top: 10.0, right: horizontalMargin),
        child: Text(times[index],
            style: TextStyle(color: Colors.black.withAlpha(165))));
  }

  Widget _buildConversationInfo(int index) {
    return Center(
        child: Row(children: <Widget>[
      _buildProfilePicture(index),
      Container(
          padding: EdgeInsets.only(left: 18.0, top: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildConversationName(index),
                _buildConversationLastMessage(index)
              ]))
    ]));
  }

  Widget _buildProfilePicture(int index) {
    return Container(
        margin: EdgeInsets.only(left: horizontalMargin),
        child: Stack(alignment: Alignment.center, children: <Widget>[
      Container(
          alignment: Alignment.center,
          width: 66.0,
          height: 66.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(images[index])),
          )),
      _buildOnlineIndicator(index)
    ]));
  }

  Widget _buildOnlineIndicator(int index) {
    Widget onlineIndicator = Container();

    if (onlineStatuses[index]) {
      onlineIndicator = Container(
        margin: EdgeInsets.only(top: 46.0, left: 46.0),
        alignment: Alignment.center,
        width: 17.0,
        height: 17.0,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Container(
          alignment: Alignment.center,
          width: 12.0,
          height: 12.0,
          decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        ),
      );
    }

    return onlineIndicator;
  }

  Widget _buildConversationName(int index) {
    return Container(
        child: Text(names[index], style: TextStyle(fontSize: 17.0)));
  }

  Widget _buildConversationLastMessage(int index) {
    return Flexible(
        child: Container(
            width: 300.0,
            padding: EdgeInsets.only(top: 3.0),
            child: Text(messages[index],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey))));
  }
}
