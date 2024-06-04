import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/pages/Home/widget/custom_drawer.dart';
import 'package:news_app/pages/setting/widget/language_bottom.dart';
import 'package:news_app/pages/setting/widget/setting_item.dart';
import 'package:provider/provider.dart';

import '../../core/provider.dart';

class setting extends StatefulWidget {
  static String routeName = "setting";

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pattern.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            children: [
              settingItems(
                settingTitle: locale.language,
                settingOption:
                appProvider.currentLocale == "en" ? "English" : "عربي",
                onOptionTaped: () {
                  showLangugeBottomSheet(context);
                },
              ),
              const SizedBox(height: 20),


            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

void showLangugeBottomSheet(context) {
  showBottomSheet(context: context, builder: (context) => language());
}

