import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class FirebaseAuthPage extends StatefulWidget {
  static const String routeName = '/firebase_auth';

  @override
  _FirebaseAuthPageState createState() => _FirebaseAuthPageState();
}

class _FirebaseAuthPageState extends State<FirebaseAuthPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _message = '...';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String> _testSignInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  Future<String> _testSignInWithEmail(String email, String password) async {
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      _message = 'sign in with email succeeded';
    });
    return 'signInWithEmail succeeded: $user';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
      ),
      body: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialButton(
              child: Text('Test signInWithGoogle'),
              onPressed: () {
                setState(() {
                  _testSignInWithGoogle();
                });
              }),
          MaterialButton(
              child: Text('Test signInWithEmail'),
              onPressed: () {
                _testSignInWithEmail(_emailController.text, _passwordController.text);
              }),
          Container(
              margin: EdgeInsets.only(
                top: 8.0,
                bottom: 8.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      )),
                  TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      )),
                ],
              )
          ),
          Text(_message)
        ],
      ),),
    );
  }
}