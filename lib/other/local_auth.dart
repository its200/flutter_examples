import 'package:flutter/material.dart';
import 'dart:async';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_examples/tools.dart';

class LocalAuth extends StatelessWidget {
  static const String routeName = '/local_auth';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Authentication"),
      ),
      body: new AuthPage(),
    );
  }
}

class AuthPage extends StatefulWidget {
  @override
  AuthPageState createState() => new AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new RaisedButton(
          color: Colors.redAccent[400],
          onPressed: _goToBiometrics,
          child: new Icon(
            Icons.fingerprint,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<Null> _goToBiometrics() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    if (authenticated) {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new LoginSuccess()),
      );
    } else {
      Tools.showAlertPopup(
          context, "Info", "Login Failed\nPlease Try Biometrics Again");
    }
  }
}

class LoginSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Successful"),
      ),
      body: new Center(
        child: new Text("Login Successfully"),
      ),
    );
  }
}
