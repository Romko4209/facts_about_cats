import 'package:flutter/material.dart';

class Reserve extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => Reserve());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'No internet connection!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
