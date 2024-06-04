import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static bool isDark = true;

  //static Color primaryColor = const Color(0xFF39A552);

  static ThemeData light = ThemeData(

      primaryColor: const Color(0xFF39A552),

      scaffoldBackgroundColor: Colors.transparent,


      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0xFF39A552),
        toolbarHeight: 75,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(42),
              bottomRight: Radius.circular(42),
            )
        ),

      ),

      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFFC91C22),
        seedColor: const Color(0xFF363636),
        onSecondary: const Color(0xFFFACC1D),
      ),

      textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),

          titleMedium: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),

          bodyMedium: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 15,
            color: Color(0xFF42505C),
          )

      )

  );


}