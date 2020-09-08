import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/base/model/post_model.dart';
import 'package:flutterfoodapp/core/constants/enums/http_enums.dart';
import 'package:flutterfoodapp/core/init/network/model/ICoreDio.dart';
import 'package:flutterfoodapp/core/init/network/network_manager.dart';
import 'package:flutterfoodapp/view/home/home.dart';

abstract class HomePageViewModel extends State<HomePage> {
  // Add your state and logic here
  String errorMessage = "";
  List<PostModel> postModels = [];
  bool isLoading = false;
  ICoreDio coreDio;
  @override
  void initState() {
    super.initState();
    this.coreDio = NetworkManager.instance.coreDio;
    getPosts();
  }

  Future<void> getPosts() async {
    changeLoading();
    try {
      postModels = (await coreDio.fetch<List<PostModel>, PostModel>("posts",
              type: HttpTypes.GET, parseModel: PostModel()))
          .data;
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
