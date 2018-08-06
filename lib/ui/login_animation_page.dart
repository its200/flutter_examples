import 'package:flutter/material.dart';

class LoginAnimationPage extends StatefulWidget {
  static String routeName = '/login_page';

  @override
  _LoginAnimationPageState createState() => _LoginAnimationPageState();
}

class _LoginAnimationPageState extends State<LoginAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final TextStyle textStyle = TextStyle(color: Colors.white);

  @override
  void initState() {
    super.initState();

    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.decelerate);

    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/lake-tekapo.jpg"),
            fit: BoxFit.fill,
            color: Colors.black45,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white10,
                elevation: 8.0,
                margin: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: FlutterLogo(
                        colors: Colors.blue,
                        size: _iconAnimation.value * 128,
                      ),
                    ),
                    Form(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 24.0,
                                bottom: 8.0,
                                left: 16.0,
                                right: 16.0),
                            child: TextField(
                              style: textStyle,
                              decoration: InputDecoration(
                                labelStyle: textStyle,
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0,
                                bottom: 16.0,
                                left: 16.0,
                                right: 16.0),
                            child: TextField(
                              style: textStyle,
                              decoration: InputDecoration(
                                labelStyle: textStyle,
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 24.0),
                      child: OutlineButton(
                        onPressed: () {
                          print('I was tapped!');
                        },
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        textTheme: ButtonTextTheme.normal,
                        child: Text('Log In'),
                        highlightedBorderColor: Colors.blue,
                        highlightColor: Colors.blue,
                        splashColor: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
