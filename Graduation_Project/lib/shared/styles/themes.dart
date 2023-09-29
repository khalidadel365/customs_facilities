import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
      bodyText1: GoogleFonts.openSans(
        fontSize: 28,
        fontWeight: FontWeight.w600
      ),
      bodyText2: GoogleFonts.openSans(
        fontSize: 15,
    ),
  ),
);