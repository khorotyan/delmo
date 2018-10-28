import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Leaderboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaderboardState();
  }
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Text('Leaderboard',
                style: TextStyle(color: Colors.white, fontSize: 18.0))),
        backgroundColor: Colors.red);
  }
}
