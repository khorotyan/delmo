import 'package:flutter/material.dart';

import './screens/auth/index.dart';

void main() => runApp(new Main());

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delmo',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.redAccent,
          buttonColor: Colors.redAccent),
      routes: {
        // Later check, if authenticated take to another screen else to auth page
        '/': (BuildContext context) => AuthOptions(),
        '/signIn': (BuildContext context) => AuthPage(isSignIn: true),
        '/signUp': (BuildContext context) => AuthPage(isSignIn: false),
        '/forgotPassword': (BuildContext context) => ForgotPassword()
      },
    );
  }
}
