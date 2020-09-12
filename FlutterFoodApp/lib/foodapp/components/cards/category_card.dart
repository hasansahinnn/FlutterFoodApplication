import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/foodapp/models/Categories.dart';

class CategoryCard extends StatelessWidget {
  final Categories category;

  const CategoryCard({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Stack(
          children: [
            categoryPhoto(category.photoUrl, width, height),
            categoryText(category.categoryName, category.totalItem),
          ],
        ),
      ),
    );
  }

  ClipRRect categoryPhoto(String photoUrl, double width, double height) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image(
            width: width * 0.35,
            height: height * 0.2,
            image: NetworkImage(photoUrl),
            fit: BoxFit.cover));
  }

  Positioned categoryText(String categoryName, int itemCount) {
    return Positioned(
        left: 4,
        bottom: 2,
        child: Row(
          children: [
            Text(
              "$categoryName - ",
            ),
            Text("$itemCount Item",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ));
  }
}
