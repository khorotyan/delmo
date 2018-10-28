import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Messaging extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessagingState();
  }
}

class _MessagingState extends State<Messaging> {
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
            child: Text('Messaging',
                style: TextStyle(color: Colors.white, fontSize: 18.0))),
        backgroundColor: Colors.green);
  }
}
