import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import '../../app.dart';

class SplashPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  _SplashPageState createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds:
          App(authenticationRepository: AuthenticationRepository()),
      title: Text(
        'Loading app...',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset(
        'assets/image/cat.png',
      ),
      photoSize: 100,
      gradientBackground: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.purple.withOpacity(0.3),
          Colors.purple,
        ],
      ),
      styleTextUnderTheLoader: TextStyle(),
    );
  }
}
