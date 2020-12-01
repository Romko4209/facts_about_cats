import 'package:cached_network_image/cached_network_image.dart';
import 'package:facts_about_cats/button_like/widget/button_like.dart';
import 'package:facts_about_cats/cats/models/models.dart';
import 'package:facts_about_cats/detail/view/detail_page.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({@required this.cat, @required this.routeToDetail});

  final Cat cat;
  final bool routeToDetail;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: routeToDetail == true
              ? () {
                  //print(cat.imageURL);
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                        builder: (context) => DetailPage(cat)),
                  );
                }
              : null,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Hero(
                tag: cat.imageURL,
                child: CachedNetworkImage(
                  imageUrl: cat.imageURL,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    child: Image.asset(
                      'assets/image/loading.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          elevation: 4,
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
          child: Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonLike(cat),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
