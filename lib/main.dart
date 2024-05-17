import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'modules/Intro/screens/SplashScreen.dart';
import 'styles/Theme.dart';
import 'utils/GlobalContext.dart';
import 'configs/Language.dart';
import 'utils/LocalStorage.dart';
import 'utils/Utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: Language.sppLanguage,
      path: 'assets/translations',
      saveLocale: true,
      startLocale: Language.sppLanguage.first,
      fallbackLocale: Language.sppLanguage.first,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalContext.context = context;
    final botToastBuilder = BotToastInit();
    return GestureDetector(
      onTap: () {
        dismissKeyboard();
      },
      child: MaterialApp(
        theme: lightTheme(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: GlobalContext.navigatorKey,
        home: const SplashScreen(),
        builder: (BuildContext context, child) {
          child = botToastBuilder(context, child);

          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: txtScale,
            ),
            child: child,
          );
        },
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
