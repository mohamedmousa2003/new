import 'package:flutter/material.dart';
import 'package:news_app/pages/Home/home_screen_view.dart';
import 'package:news_app/pages/setting/setting_view.dart';


class CustomDrawer extends StatelessWidget {

  const CustomDrawer({super.key });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery
        .of(context)
        .size;
    var theme = Theme.of(context);
    return Container(
      width: mediaQuery.width * 0.7,
      color: Colors.white,
      child: Scaffold(
        body: Column(

          children: [

            Container(
              padding: const EdgeInsets.all(40),
              color: theme.primaryColor,
              width: mediaQuery.width * 0.7,
              height: mediaQuery.height * 0.15,
              child: Text(" News App!",
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,


              ),

            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                        Icons.menu, size: 38
                    ),

                    const SizedBox(
                      width: 15,
                    ),
                    Text("Categories",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, setting.routeName);
                },
                child: Row(
                  children: [
                    const Icon(
                        Icons.settings, size: 38
                    ),

                    const SizedBox(
                      width: 15,
                    ),
                    Text("Settings",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
