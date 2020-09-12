import 'package:flutter/material.dart';
import 'package:flutterfoodapp/foodapp/services/interfaces/ICategoryService.dart';
import 'package:flutterfoodapp/foodapp/services/interfaces/IProductService.dart';

import '../../models/Categories.dart';
import '../../models/Product.dart';
import '../../services/category_service.dart';
import '../../services/product_service.dart';
import 'home.dart';

abstract class HomePageViewModel extends State<HomePage> {
  List<Categories> categories = [];
  List<Product> popularProducts = [];
  bool isLoading = false;
  ICategoryService categoryService;
  IProductService productService;
  @override
  void initState() {
    super.initState();
    categoryService = CategoryService.instance;
    productService = ProductService.instance;
    getHomePageData();
  }

  Future<void> getHomePageData() async {
    changeLoading();
    try {
      categories = await categoryService.getCategoryList();
      popularProducts = await productService.getMostPopularProducts();
    } catch (e) {
      showErrorDialog(e.toString());
    }
    changeLoading();
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Text(message),
      ),
    );
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
