import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/base/model/generalSettingsButton.dart';
import '../../../core/components/button/shadow_button.dart';
import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/extensions_provider.dart';
import '../../../core/extensions/future_builder.dart';
import '../../../core/init/notifier/theme_notifer.dart';
import '../../components/cards/category_card.dart';
import '../../components/cards/productCard.dart';
import '../../models/Categories.dart';
import '../../models/Product.dart';
import 'home_view_model.dart';

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
              Expanded(flex: 15, child: headerContainer),
              Expanded(flex: 25, child: categoriesList),
              Expanded(flex: 60, child: popularProductArea)
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
        padding:
            EdgeInsets.fromLTRB(context.mediumValue, 0, context.mediumValue, 0),
        child: Row(children: [
          Expanded(flex: 5, child: headerContainerText),
          Spacer(flex: 3),
          ShadowButton(
              backgroundColor: context.colors.onSecondary,
              iconColor: context.theme.primaryIconTheme.color,
              icon: Icons.search,
              callBack: () {})
        ]));
  }

  Text get headerContainerText {
    return Text("What do you want to eat today?".locale,
        style:
            context.textTheme.headline5.copyWith(fontWeight: FontWeight.bold));
  }
  // ---------------------------- headerContainer

  // ---------------------------- Categories List

  Widget get categoriesList {
    return Container(
        padding: EdgeInsets.only(left: context.mediumValue),
        child: Future.value(categoryService.getCategoryList())
            .toBuild<List<Categories>>(onSuccess: (data) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  CategoryCard(category: data[index]));
        }));
  }

  // ---------------------------- Categories List

  // ---------------------------- Popular Product List

  Widget get popularProductArea {
    return Container(
        margin: EdgeInsets.only(top: context.lowValue),
        color: context.theme.highlightColor,
        child: Padding(
          padding: context.paddingMedium,
          child: Column(children: [
            popularProductHeader,
            SizedBox(
              height: context.mediumValue,
            ),
            popularProductList
          ]),
        ));
  }

  Row get popularProductHeader {
    return Row(
      children: [
        popularProductHearthIcon,
        SizedBox(
          width: context.lowValue * 2,
        ),
        popularProductHeaderText,
        Spacer(),
        IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {})
      ],
    );
  }

  Container get popularProductHearthIcon {
    return Container(
        decoration: BoxDecoration(
            color: context.theme.indicatorColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: IconButton(
            icon: Icon(Icons.favorite), color: Colors.white, onPressed: () {}));
  }

  Column get popularProductHeaderText {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Popular".locale, style: context.textTheme.headline6),
        SizedBox(height: context.height * 0.01),
        Text("Monggo, entekno duwekmul",
            style: context.textTheme.button
                .copyWith(color: context.theme.splashColor)),
      ],
    );
  }

  Widget get popularProductList {
    return Expanded(
        flex: 1,
        child: Future.value(productService.getMostPopularProducts())
            .toBuild<List<Product>>(onSuccess: (data) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) => ProductCard(
                    product: data[index],
                    width: context.width,
                    height: context.height,
                    cardColor: context.theme.cardColor,
                  ));
        }));
  }

  // ---------------------------- Popular Product List

}
