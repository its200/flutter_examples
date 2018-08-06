import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  static const String routeName = '/form_demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (val) => _validateEmail(val),
                onSaved: (val) => _email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                validator: (val) => _validatePwd(val),
                onSaved: (val) => _password = val,
                obscureText: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _performLogin() {
    final snackbar = SnackBar(
      content: Text("Email: $_email, password: $_password"),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  String _validateEmail(String email) {
    RegExp exp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return !exp.hasMatch(email) ? "Invalid Email" : null;
  }

  String _validatePwd(String pwd) {
    return pwd.length < 5 ? "Invalid Password" : null;
  }
}
