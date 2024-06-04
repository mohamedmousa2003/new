import 'package:flutter/material.dart';
import 'package:news_app/core/provider.dart';
import 'package:news_app/core/theme.dart';
import 'package:news_app/pages/Home/home_screen_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/pages/details/news_detalis_screen.dart';
import 'package:news_app/pages/setting/setting_view.dart';
import 'package:news_app/pages/splash/splash_screen_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      title: 'News APP',

      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(appProvider.currentLocale),

      theme: ApplicationTheme.light,


      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        setting.routeName: (context) => setting(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),


      },
      home: const SplashScreen(),
    );
  }
}
