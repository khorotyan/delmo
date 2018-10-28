import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RatePeople extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RatePeopleState();
  }
}

class _RatePeopleState extends State<RatePeople> {
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
            child: Text('Rate People',
                style: TextStyle(color: Colors.white, fontSize: 18.0))),
        backgroundColor: Colors.orange);
  }
}
