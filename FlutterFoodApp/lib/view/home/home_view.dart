import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/base/model/generalSettingsButton.dart';
import 'package:flutterfoodapp/core/constants/app/app_constants.dart';
import 'package:flutterfoodapp/core/init/notifier/theme_notifer.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';
import '../../core/extensions/extensions_provider.dart';

class HomePageView extends HomePageViewModel {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  var themeProvider;
  dynamic locales;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeNotifier>(context);
    locales = EasyLocalization.of(context);
    return Scaffold(
        appBar: mainAppBar,
        body: SafeArea(
          child: Container(child: Text("1")),
        ));
  }

  AppBar get mainAppBar {
    return AppBar(
      title: Text(AppConstansts.APP_NAME.locale),
      leading: Icon(Icons.arrow_left),
      actions: [
        pageRefreshButton,
        GeneralSettingsButton(
          themeProvider: themeProvider,
          locales: locales,
        )
      ],
    );
  }

  IconButton get pageRefreshButton =>
      IconButton(onPressed: () {}, icon: Icon(Icons.refresh));
}
