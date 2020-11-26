import 'package:flutter/material.dart';

class FactCard extends StatelessWidget {
  FactCard(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Fact',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
