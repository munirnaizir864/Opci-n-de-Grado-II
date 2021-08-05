import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final white = Colors.white;
  static final black = Colors.black;
  static final defaultColor = Color.fromRGBO(23, 43, 77, 1); //#172B4D
  static final lightGrey = Colors.grey[400];
  static final blue = Color.fromRGBO(94, 114, 228, 1); //35E72E4
  static final background = Color.fromRGBO(247, 250, 252, 1); //#F7FAFC
  static final green = Color.fromRGBO(45, 206, 137, 1); // #2DCE89
  static final pink = Color.fromRGBO(254, 36, 114, 1); //#FE2472
  static final purple = Color.fromRGBO(156, 38, 176, 1); //#9C26B0
  static final gradientStart = Color(0xFFBBBBBB); //#6B24AA
  static final gradientEnd = Color.fromRGBO(172, 38, 136, 1); //#AC2688
  static final red = Color.fromRGBO(218, 41, 28, 1); //#de3a44
  static final bordercolor = Color.fromRGBO(231, 231, 231, 1); //#E7E7E7
  static final iconColor = Color.fromRGBO(23, 43, 77, 1); //#172B4D
  static final appBarText = Color.fromRGBO(82, 95, 127, 1); //#525F7F
  static final formBackground = Color.fromRGBO(206, 223, 235, 1);
}

final gradient = [AppColors.gradientStart, AppColors.gradientEnd];

final _borderLight = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
        color: AppColors.bordercolor, width: 1, style: BorderStyle.solid));

// final _borderDark = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(5),
//     borderSide: BorderSide(
//         color: AppColors.bordercolor, width: 2, style: BorderStyle.solid));

final lightTheme = ThemeData(
  fontFamily: 'Times New Roman',
  brightness: Brightness.light,
  primaryColor: AppColors.blue,
  scaffoldBackgroundColor: AppColors.background,
  backgroundColor: Colors.white,
  canvasColor: Colors.white,
  //accentColor: AppColors.purple,
  // secondaryHeaderColor: AppColors.lightGrey,
  // selectedRowColor: AppColors.veryLightGrey,
  appBarTheme: AppBarTheme(
    brightness: Brightness.light,
    color: Colors.white,
    elevation: 2,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.iconColor,
      displayColor: AppColors.iconColor,
    ),
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(fontFamily: 'Times New Roman'),
      bodyText2: TextStyle(fontFamily: 'Times New Roman')),
  inputDecorationTheme: InputDecorationTheme(
      border: _borderLight,
      enabledBorder: _borderLight,
      focusedBorder: _borderLight,
      fillColor: AppColors.white,
      filled: true,
      labelStyle: TextStyle(color: AppColors.purple),
      hintStyle:
          GoogleFonts.poppins(color: AppColors.bordercolor, fontSize: 10)),
  iconTheme: IconThemeData(color: AppColors.iconColor),
  cardColor: Colors.white,
);

// final darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: AppColors.dark,
//     secondaryHeaderColor: AppColors.white,
//     backgroundColor: AppColors.grey,
//     canvasColor: AppColors.grey,
//     accentColor: AppColors.green,
//     selectedRowColor: Colors.transparent,
//     appBarTheme: AppBarTheme(
//         brightness: Brightness.dark, color: AppColors.purple, elevation: 2),
//     textTheme: GoogleFonts.poppinsTextTheme()
//         .apply(bodyColor: AppColors.green, displayColor: AppColors.green),
//     inputDecorationTheme: InputDecorationTheme(
//         border: _borderDark,
//         enabledBorder: _borderDark,
//         focusedBorder: _borderDark,
//         fillColor: AppColors.grey,
//         labelStyle: TextStyle(color: AppColors.white),
//         filled: true,
//         hintStyle: GoogleFonts.poppins(color: AppColors.white, fontSize: 10)),
//     iconTheme: IconThemeData(color: AppColors.white),
//     cardColor: AppColors.grey);
