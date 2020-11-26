import 'package:facts_about_cats/cats/models/models.dart';
import 'package:facts_about_cats/cats/widgets/list_item.dart';
import 'package:facts_about_cats/detail/widgets/fact_card.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  DetailPage(this.cat);

  final Cat cat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          // ignore: deprecated_member_use
          style: Theme.of(context).accentTextTheme.title,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListItem(
              cat: cat,
              routeToDetail: false,
            ),
            FactCard(cat.fact)
          ],
        ),
      ),
    );
  }
}
