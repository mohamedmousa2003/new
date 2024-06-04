import 'dart:async';
import 'package:flutter/material.dart';
import '../Home/home_screen_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/pattern.png"),


          fit: BoxFit.cover,
        ),
        color: Colors.white,
      ),

      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image(
            image: AssetImage("assets/logo.png"),
          ),
        ),


      ),
    );
  }

}
