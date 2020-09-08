import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterfoodapp/core/constants/enums/app_theme_enum.dart';
import 'package:flutterfoodapp/core/init/lang/language_service.dart';
import 'package:flutterfoodapp/core/init/notifier/theme_notifer.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';
import '../../core/extensions/extensions_provider.dart';

class HomePageView extends HomePageViewModel {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    //final response = await coreDio.fetch<List<TestModel>, TestModel>("x", type: HttpTypes.GET, parseModel: TestModel());
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("test".locale),
      ),
      body: SafeArea(
          child: Container(
        child: Row(
          children: [
            RaisedButton.icon(
                padding: context.paddingLow,
                onPressed: () => themeProvider.setTheme(AppThemes.DARK),
                icon: Icon(Icons.access_alarm),
                label: Text("Degisss")),
            RaisedButton.icon(
                onPressed: () => themeProvider.setTheme(AppThemes.LIGHT),
                icon: Icon(
                  Icons.access_alarm,
                ),
                label: Text(
                  "Degisss",
                  style: context.textTheme.bodyText1,
                )),
            Column(
              children: LanguageService.instance.locales
                  .map(
                    (e) => RaisedButton.icon(
                      onPressed: () {
                        EasyLocalization.of(context).locale = e;
                      },
                      icon: Icon(
                        Icons.sort_by_alpha,
                      ),
                      label: Text(e.localeTag),
                    ),
                  )
                  .toList(),
            ),
            isLoading
                ? CircularProgressIndicator()
                : Text(postModels.length.toString())
          ],
        ),
      )),
    );
  }
}
