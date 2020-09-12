import 'package:flutter/material.dart';
import 'package:flutterfoodapp/foodapp/services/interfaces/ICategoryService.dart';
import 'package:flutterfoodapp/foodapp/services/interfaces/IProductService.dart';

import '../../services/category_service.dart';
import '../../services/product_service.dart';
import 'home.dart';

abstract class HomePageViewModel extends State<HomePage> {
  ICategoryService categoryService;
  IProductService productService;
  @override
  void initState() {
    super.initState();
    categoryService = CategoryService.instance;
    productService = ProductService.instance;
  }
}
