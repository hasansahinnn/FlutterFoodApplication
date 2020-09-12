import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/base/model/generalSettingsButton.dart';
import 'package:flutterfoodapp/core/components/button/shadow_button.dart';
import 'package:flutterfoodapp/core/constants/app/app_constants.dart';
import 'package:flutterfoodapp/core/init/notifier/theme_notifer.dart';
import 'package:flutterfoodapp/foodapp/components/cards/category_card.dart';
import 'package:flutterfoodapp/foodapp/models/Categories.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';
import '../../../core/extensions/extensions_provider.dart';
import '../../../core/extensions/future_builder.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: headerContainer),
              Expanded(flex: 3, child: categoriesList),
              Expanded(flex: 6, child: Container())
            ],
          ),
        ));
  }

  // ---------------------------- Appbar

  AppBar get mainAppBar {
    return AppBar(elevation: 0, actions: [
      Expanded(
          child: Row(children: [
        IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
        Spacer(),
        appBarTitle,
        Spacer(),
        appBarRefreshButton,
        GeneralSettingsButton(themeProvider: themeProvider, locales: locales)
      ]))
    ]);
  }

  Widget get appBarTitle {
    return Text(AppConstansts.APP_NAME.locale,
        style: context.textTheme.headline6);
  }

  IconButton get appBarRefreshButton => IconButton(
      onPressed: () {
        categoriesList;
      },
      icon: Icon(Icons.refresh));

  // ---------------------------- Appbar

  // ---------------------------- headerContainer

  Widget get headerContainer {
    return Container(
      padding: context.paddingMedium,
      child: Row(
        children: [
          Expanded(flex: 5, child: headerContainerText),
          Spacer(flex: 3),
          ShadowButton(
            backgroundColor: context.colors.onSecondary,
            iconColor: context.theme.primaryIconTheme.color,
            icon: Icons.search,
            callBack: () {},
          ),
        ],
      ),
    );
  }

  Text get headerContainerText {
    return Text(
      "What do you want to eat today?",
      style: context.textTheme.headline5.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
  // ---------------------------- headerContainer

  // ---------------------------- Categories List

  Widget get categoriesList {
    return Container(
        padding: EdgeInsets.only(left: context.mediumValue),
        child: Future.value(categoryService.getCategoryList())
            .toBuild<List<Categories>>(
          onSuccess: (data) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  CategoryCard(category: data[index]),
            );
          },
        ));
  }

  // ---------------------------- Categories List

}
