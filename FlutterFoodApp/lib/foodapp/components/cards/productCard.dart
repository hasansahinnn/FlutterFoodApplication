import 'package:flutter/material.dart';

import '../../../core/extensions/string_extension.dart';
import '../../models/Product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double width;
  final double height;
  final Color cardColor;
  const ProductCard(
      {Key key,
      @required this.product,
      this.width,
      this.height,
      this.cardColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ProductDetail(
        //         productId: product.id,
        //       ),
        //     ));
      },
      child: productCardItem,
    );
  }

  Container get productCardItem {
    return Container(
      height: height * 0.15,
      margin: EdgeInsets.only(bottom: height * 0.02),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: cardColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cardPhoto,
          SizedBox(
            width: width * 0.02,
          ),
          cardDetails,
        ],
      ),
    );
  }

  ClipRRect get cardPhoto {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image(
            height: height * 0.2,
            width: width * 0.25,
            image: NetworkImage(product.defaultPhoto),
            fit: BoxFit.cover));
  }

  Column get cardDetails {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.productName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        subCategories,
        SizedBox(
          height: height * 0.010,
        ),
        cardPriceArea,
      ],
    );
  }

  SizedBox get subCategories {
    return SizedBox(
      width: width * 0.55,
      height: height * 0.03,
      child: ListView.builder(
        itemCount: product.subCategories?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => subCategoryBox(
            product.subCategories[index].subCategoryName,
            product.subCategories[index].colorType),
      ),
    );
  }

  Widget get cardPriceArea {
    return Container(
      width: width * 0.55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              flex: 5,
              child: Text(
                product.subtitle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                "Piece".locale + ":" + product.stock.toString(),
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 4,
              child: Text(
                "Price".locale + ":" + product.price.toString() + " TL",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Container subCategoryBox(name, type) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: getmainColor(type, 100)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 2, right: 8, bottom: 2),
        child: Text(
          name,
          style: TextStyle(
              color: getmainColor(type, 400),
              fontSize: 10,
              fontWeight: FontWeight.w400,
              backgroundColor: getmainColor(type, 100)),
        ),
      ),
    );
  }
}

Color getmainColor(type, weight) {
  Color color;
  switch (type) {
    case 1:
      color = Colors.green[weight];
      break;
    case 2:
      color = Colors.blue[weight];
      break;
    case 3:
      color = Colors.orange[weight];
      break;
    case 4:
      color = Colors.red[weight];
      break;
    default:
  }
  return color;
}
