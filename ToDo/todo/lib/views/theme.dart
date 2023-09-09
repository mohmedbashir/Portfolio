import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const bluishClr = Colors.indigo;
const Color orangeClr = Color.fromARGB(207, 249, 148, 93);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF303030);
const Color darkHeaderClr = Color(0xFF303030);
const Color lightHeaderClr = Color(0xFFFAFAFA);

class Themes {
  static final light = ThemeData(
      primaryColor: bluishClr,
      primarySwatch: bluishClr,
      backgroundColor: lightHeaderClr,
      brightness: Brightness.light);

  static final dark = ThemeData(
      primaryColor: bluishClr,
      primarySwatch: bluishClr,
      backgroundColor: darkHeaderClr,
      brightness: Brightness.dark);
}

TextStyle get headingStyle1 => GoogleFonts.nunito(
      fontSize: 38,
      fontWeight: FontWeight.w800,
    );
TextStyle get headingStyle2 => GoogleFonts.nunito(
      fontSize: 25,
      fontWeight: FontWeight.w700,
    );
TextStyle get headingStyle3 => GoogleFonts.nunito(
      fontSize: 23,
      fontWeight: FontWeight.w700,
    );
TextStyle get headingStyle4 => GoogleFonts.nunito(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
TextStyle get headingStyle5 => GoogleFonts.nunito(
      fontSize: 17,
      fontWeight: FontWeight.w500,
    );
TextStyle get headingStyle6 => GoogleFonts.nunito(
      fontSize: 15.5,
      fontWeight: FontWeight.w500,
    );
