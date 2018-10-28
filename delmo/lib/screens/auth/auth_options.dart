import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthOptionsState();
  }
}

class _AuthOptionsState extends State<AuthOptions> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment(0.0, 0.0),
      decoration: BoxDecoration(image: _getBackgroundImage()),
      child: Container(
          alignment: Alignment(0.0, 0.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(children: <Widget>[
            Spacer(flex: 1),
            _buildAppName(),
            SizedBox(height: 16.0),
            _buildAppSlogan(),
            Spacer(flex: 3),
            _buildJoinButton(),
            SizedBox(height: 26.0),
            _buildLoginButton(),
            SizedBox(height: 46.0)
          ])),
    ));
  }

  DecorationImage _getBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.red.withOpacity(0.05), BlendMode.srcOver),
        image: AssetImage('images/auth_background.jpg'));
  }

  Text _buildAppName() {
    return Text('Delmo',
        style: TextStyle(
            color: Colors.white,
            fontFamily: '',
            fontSize: 34.0,
            fontWeight: FontWeight.bold));
  }

  Text _buildAppSlogan() {
    return Text('Flirt, chat and meet people around you',
        style: TextStyle(color: Colors.white, fontSize: 16.0));
  }

  ButtonTheme _buildJoinButton() {
    return ButtonTheme(
        minWidth: 300.0,
        height: 51.0,
        child: RaisedButton(
            child: Text('JOIN DELMO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () => Navigator.pushNamed(context, '/signUp')));
  }

  ButtonTheme _buildLoginButton() {
    return ButtonTheme(
        minWidth: 300.0,
        height: 51.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text('LOGIN',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            onPressed: () => Navigator.pushNamed(context, '/signIn')));
  }
}
