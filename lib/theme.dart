import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
  textTheme: GoogleFonts.playfairDisplayTextTheme(
      // Theme.of(context).primaryTextTheme,
      // TextTheme( )

      ),
  primaryColor: Color.fromRGBO(90, 52, 18, 1),
  scaffoldBackgroundColor: Color.fromRGBO(255, 249, 230, 1),
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,
);
