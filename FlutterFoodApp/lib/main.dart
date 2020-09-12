import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_service.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/notifier/provider_list.dart';
import 'core/init/notifier/theme_notifer.dart';
import 'foodapp/view/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.prefrencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageService.instance.locales,
        path: AppConstansts.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Provider.of<ThemeNotifier>(context, listen: true).currentTheme,
      title: AppConstansts.APP_NAME,
      home: HomePage(),
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
