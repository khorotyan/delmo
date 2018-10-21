import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  static const String _nameInputKey = 'NameInput';
  static const String _ageInputKey = 'AgeInput';
  static const String _emailInputKey = 'EmailInput';
  static const String _passwordInputKey = 'PasswordInput';
  static const Color _normalEditColor = Color(0xFFE0E0E0);
  static const Color _selectedEditColor = Colors.white;
  static const String _nameInputLabel = 'First Name';
  static const String _ageInputLabel = 'Age';
  static const String _emailInputLabel = 'Email';
  static const String _passwordInputLabel = 'Password';

  final _formKey = GlobalKey<FormState>();
  final _nameInputFocusNode = FocusNode();
  final _ageInputFocusNode = FocusNode();
  final _emailInputFocusNode = FocusNode();
  final _passwordInputFocusNode = FocusNode();

  final _isFieldOnFocus = {
    _nameInputKey: false,
    _ageInputKey: false,
    _emailInputKey: false,
    _passwordInputKey: false,
  };

  @override
  void initState() {
    _nameInputFocusNode.addListener(onNameInputFocus);
    _ageInputFocusNode.addListener(onAgeInputFocus);
    _emailInputFocusNode.addListener(onEmailInputFocus);
    _passwordInputFocusNode.addListener(onPasswordInputFocus);

    super.initState();
  }

  @override
  void dispose() {
    _nameInputFocusNode.removeListener(onNameInputFocus);
    _nameInputFocusNode.dispose();

    _ageInputFocusNode.removeListener(onAgeInputFocus);
    _ageInputFocusNode.dispose();

    _emailInputFocusNode.removeListener(onEmailInputFocus);
    _emailInputFocusNode.dispose();

    _passwordInputFocusNode.removeListener(onPasswordInputFocus);
    _passwordInputFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(image: _getBackgroundImage()),
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: SingleChildScrollView(
                  child: Container(
            width: _getAuthPageWidth(),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _buildPageName(),
                    SizedBox(height: 44.0),
                    _buildNameInputField(),
                    SizedBox(height: 32.0),
                    _buildAgeInputField(),
                    SizedBox(height: 32.0),
                    _buildEmailInputField(),
                    SizedBox(height: 32.0),
                    _buildPasswordInputField(),
                    SizedBox(height: 44.0),
                    _buildButtomPanel()
                  ],
                )),
          )))),
    );
  }

  double _getAuthPageWidth() {
    double screenWidth = MediaQuery.of(context).size.width;

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? screenWidth * 0.8
        : screenWidth * 0.65;
  }

  DecorationImage _getBackgroundImage() {
    return DecorationImage(
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.red.withOpacity(0.1), BlendMode.multiply),
        image: AssetImage('images/login_background.jpg'));
  }

  Text _buildPageName() {
    return Text('SignUp',
        style: TextStyle(fontSize: 36.0, color: Colors.white));
  }

  void onNameInputFocus() {
    _isFieldOnFocus[_nameInputKey] = !_isFieldOnFocus[_nameInputKey];
  }

  void onAgeInputFocus() {
    _isFieldOnFocus[_ageInputKey] = !_isFieldOnFocus[_ageInputKey];
  }

  void onEmailInputFocus() {
    _isFieldOnFocus[_emailInputKey] = !_isFieldOnFocus[_emailInputKey];
  }

  void onPasswordInputFocus() {
    _isFieldOnFocus[_passwordInputKey] = !_isFieldOnFocus[_passwordInputKey];
  }

  Color _getTextFormFieldColor(String fieldKey) {
    bool isOnFocus = _isFieldOnFocus[fieldKey];

    if (!isOnFocus) {
      return _normalEditColor;
    }

    return _selectedEditColor;
  }

  String _getEditTextLabelText(String fieldKey) {
    switch (fieldKey) {
      case _nameInputKey:
        return _nameInputLabel;
      case _ageInputKey:
        return _ageInputLabel;
      case _emailInputKey:
        return _emailInputLabel;
      case _passwordInputKey:
        return _passwordInputLabel;
      default:
        return '';
    }
  }

  InputDecoration _buildEditTextDecoration(String fieldKey) {
    final labelText = _getEditTextLabelText(fieldKey);

    return InputDecoration(
        labelText: labelText,
        filled: true,
        labelStyle: TextStyle(color: _getTextFormFieldColor(fieldKey)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _normalEditColor)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _selectedEditColor)));
  }

  TextFormField _buildNameInputField() {
    return TextFormField(
        focusNode: _nameInputFocusNode,
        decoration: _buildEditTextDecoration(_nameInputKey),
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        style: TextStyle(color: Colors.white),
        validator: (String value) {
          if (value.isEmpty || value.length <= 2) {
            return 'Name must be at least 2 characters long';
          }

          if (!RegExp(r"^(?=.{1,12}$)[a-zA-Z]+(?:[-'][a-zA-Z]+)*$")
              .hasMatch(value)) {
            return 'Please enter a valid name';
          }
        },
        onSaved: (String value) {});
  }

  TextFormField _buildAgeInputField() {
    return TextFormField(
        focusNode: _ageInputFocusNode,
        decoration: _buildEditTextDecoration(_ageInputKey),
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.white),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please enter your age';
          } else if (!RegExp(r"^[0-9]*$").hasMatch(value)) {
            return 'Please enter a valid age';
          }

          int age = int.parse(value);

          if (age < 18) {
            return 'You must be at least 18 years old to use the application';
          } else if (age > 99) {
            return 'Please enter a valid age';
          }
        },
        onSaved: (String value) {});
  }

  TextFormField _buildEmailInputField() {
    return TextFormField(
        focusNode: _emailInputFocusNode,
        decoration: _buildEditTextDecoration(_emailInputKey),
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

  TextFormField _buildPasswordInputField() {
    return TextFormField(
        focusNode: _passwordInputFocusNode,
        decoration: _buildEditTextDecoration(_passwordInputKey),
        style: TextStyle(color: Colors.white),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty || value.length < 6) {
            return 'Password must have a minimum length of 6';
          }
        },
        onSaved: (String value) {});
  }

  Row _buildButtomPanel() {
    return Row(
        children: <Widget>[_buildSignupButton(), _buildAlreadyAMemberButton()],
        mainAxisAlignment: MainAxisAlignment.spaceBetween);
  }

  ButtonTheme _buildSignupButton() {
    return ButtonTheme(
        minWidth: 104.0,
        height: 44.0,
        child: RaisedButton(
            child: Text('SignUp',
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
            onPressed: () => _onSignupClick()));
  }

  void _onSignupClick() {
    _formKey.currentState.save();

    if (!_formKey.currentState.validate()) {
      return;
    }
  }

  FlatButton _buildAlreadyAMemberButton() {
    return FlatButton(
        child: Text('Already a member?', style: TextStyle(color: Colors.white)),
        onPressed: () {});
  }
}
