import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Suggestions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SuggestionsState();
  }
}

class _SuggestionsState extends State<Suggestions> {
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
            child: Text('Suggestion',
                style: TextStyle(color: Colors.white, fontSize: 18.0))),
        backgroundColor: Colors.purple);
  }
}
