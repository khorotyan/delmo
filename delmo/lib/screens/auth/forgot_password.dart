import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordState();
  }
}

class _ForgotPasswordState extends State<ForgotPassword> {
  static const String _pageTitle = 'Forgot Password';
  static const String _pageDescription =
      'Please enter your email address to get instructions on how to change your password';

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context))),
        body: Container(
            alignment: Alignment(0.0, 0.0),
            decoration: BoxDecoration(image: _getBackgroundImage()),
            child: Container(
                width: _getAuthPageWidth(),
                child: Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      _buildAppTitle(),
                      SizedBox(height: 36.0),
                      _buildDescriptionText(),
                      SizedBox(height: 46.0),
                      _buildEmailInputField(),
                      SizedBox(height: 54.0),
                      _buildSendButton()
                    ])))));
  }

  DecorationImage _getBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.red.withOpacity(0.1), BlendMode.multiply),
        image: AssetImage('images/login_background.jpg'));
  }

  double _getAuthPageWidth() {
    double screenWidth = MediaQuery.of(context).size.width;

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? screenWidth * 0.8
        : screenWidth * 0.65;
  }

  Text _buildAppTitle() {
    return Text(_pageTitle,
        style: TextStyle(fontSize: 36.0, color: Colors.white));
  }

  Text _buildDescriptionText() {
    return Text(_pageDescription,
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center);
  }

  TextFormField _buildEmailInputField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Email Address',
            labelStyle: TextStyle(color: Theme.of(context).accentColor),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).accentColor))),
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: Colors.white),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        },
        onSaved: (String value) {});
  }

  ButtonTheme _buildSendButton() {
    return ButtonTheme(
        minWidth: 96.0,
        height: 42.0,
        child: RaisedButton(
            child: Text('Send',
                style: TextStyle(color: Colors.white, fontSize: 16.0)),
            onPressed: () {}));
  }
}
