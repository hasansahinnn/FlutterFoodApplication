import 'package:flutterfoodapp/core/base/model/base_model.dart';

class Categories implements IBaseModel<Categories> {
  int id;
  String categoryName;
  String photoUrl;
  int totalItem;

  Categories({this.id, this.categoryName, this.photoUrl, this.totalItem});

  Categories.fromJson(Map<String, Object> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    photoUrl = json['photoUrl'];
    totalItem = json['totalItem'];
  }

  Map<String, Object> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['photoUrl'] = this.photoUrl;
    data['totalItem'] = this.totalItem;
    return data;
  }

  @override
  fromJson(Map<String, Object> json) {
    return Categories.fromJson(json);
  }
}
