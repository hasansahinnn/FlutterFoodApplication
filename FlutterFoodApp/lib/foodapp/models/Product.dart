import 'package:flutterfoodapp/core/base/model/base_model.dart';

class Product implements IBaseModel<Product> {
  List<ProductPhotos> productPhotos;
  List<SubCategories> subCategories;
  Null categories;
  int id;
  String productName;
  String subtitle;
  String description;
  String defaultPhoto;
  int totalItem;
  int stock;
  double stars;
  double price;
  int discountPercent;
  bool isUserFavorite;
  int userStarCount;
  int categoryId;

  Product(
      {this.productPhotos,
      this.subCategories,
      this.categories,
      this.id,
      this.productName,
      this.defaultPhoto,
      this.subtitle,
      this.description,
      this.totalItem,
      this.stock,
      this.stars,
      this.price,
      this.discountPercent,
      this.isUserFavorite,
      this.userStarCount,
      this.categoryId});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['productPhotos'] != null) {
      productPhotos = new List<ProductPhotos>();
      json['productPhotos'].forEach((v) {
        productPhotos.add(new ProductPhotos.fromJson(v));
      });
    }
    if (json['subCategories'] != null) {
      subCategories = new List<SubCategories>();
      json['subCategories'].forEach((v) {
        subCategories.add(new SubCategories.fromJson(v));
      });
    }
    categories = json['categories'];
    id = json['id'];
    productName = json['productName'];
    subtitle = json['subtitle'];
    defaultPhoto = json['defaultPhoto'];
    description = json['description'];
    totalItem = json['totalItem'];
    stock = json['stock'];
    stars = json['stars'];
    price = json['price'];
    discountPercent = json['discountPercent'];
    isUserFavorite = json['isUserFavorite'];
    userStarCount = json['userStarCount'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productPhotos != null) {
      data['productPhotos'] =
          this.productPhotos.map((v) => v.toJson()).toList();
    }
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories.map((v) => v.toJson()).toList();
    }
    data['categories'] = this.categories;
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['subtitle'] = this.subtitle;
    data['defaultPhoto'] = this.defaultPhoto;
    data['description'] = this.description;
    data['totalItem'] = this.totalItem;
    data['stock'] = this.stock;
    data['stars'] = this.stars;
    data['price'] = this.price;
    data['discountPercent'] = this.discountPercent;
    data['isUserFavorite'] = this.isUserFavorite;
    data['userStarCount'] = this.userStarCount;
    data['categoryId'] = this.categoryId;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return Product.fromJson(json);
  }
}

class ProductPhotos {
  int id;
  String photoUrl;
  int productId;

  ProductPhotos({this.id, this.photoUrl, this.productId});

  ProductPhotos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoUrl = json['photoUrl'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photoUrl'] = this.photoUrl;
    data['productId'] = this.productId;
    return data;
  }
}

class SubCategories {
  int id;
  String subCategoryName;
  int colorType;
  int productId;

  SubCategories(
      {this.id, this.subCategoryName, this.colorType, this.productId});

  SubCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryName = json['subCategoryName'];
    colorType = json['colorType'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subCategoryName'] = this.subCategoryName;
    data['colorType'] = this.colorType;
    data['productId'] = this.productId;
    return data;
  }
}
