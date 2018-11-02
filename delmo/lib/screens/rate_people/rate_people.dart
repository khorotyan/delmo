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
        backgroundColor: Colors.black.withAlpha(4),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2),
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Text('Whom do you like more?',
                          style: TextStyle(fontSize: 22.0)))),
              Expanded(
                  flex: 9,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Text('Kendall',
                                      style: TextStyle(fontSize: 18.0))),
                              IconButton(
                                  iconSize: 60.0,
                                  tooltip: 'Previous image',
                                  icon: Icon(Icons.arrow_drop_up),
                                  onPressed: () {}),
                              Stack(children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                        'images/user1_profile1.jpg',
                                        width: 150.0,
                                        height: 150.0,
                                        fit: BoxFit.cover)),
                                Material(
                                  color: Colors.transparent,
                                  child: Ink.image(
                                    image: AssetImage(
                                      '',
                                    ),
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20.0),
                                      onTap: () {},
                                      child: null,
                                    ),
                                  ),
                                ),
                              ]),
                              IconButton(
                                  iconSize: 60.0,
                                  tooltip: 'Next image',
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {})
                            ]),
                        Container(
                            padding: EdgeInsets.only(top: 166.0),
                            child:
                                Text('VS', style: TextStyle(fontSize: 22.0))),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Text('Emily',
                                      style: TextStyle(fontSize: 18.0))),
                              IconButton(
                                  iconSize: 60.0,
                                  tooltip: 'Previous image',
                                  icon: Icon(Icons.arrow_drop_up),
                                  onPressed: () {}),
                              Stack(children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                        'images/user2_profile1.jpg',
                                        width: 150.0,
                                        height: 150.0,
                                        fit: BoxFit.cover)),
                                Material(
                                  color: Colors.transparent,
                                  child: Ink.image(
                                    image: AssetImage(
                                      '',
                                    ),
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(20.0),
                                      onTap: () {},
                                      child: null,
                                    ),
                                  ),
                                ),
                              ]),
                              IconButton(
                                  iconSize: 60.0,
                                  tooltip: 'Next image',
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {})
                            ])
                      ])),
            ]));
  }
}
