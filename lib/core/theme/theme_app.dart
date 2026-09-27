import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData liteTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xffc4e1f6),
      foregroundColor: Color(0xff45496a),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: Color(0xff45496a)),
    ),
    iconTheme: IconThemeData(color: Color(0xff45496a), size: 30),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff45496a),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight(600)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        foregroundColor: Color(0xff45496a),
        backgroundColor: Color(0xffc4e1f6),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight(600)),
        fixedSize: Size(400, 60),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xffffffff),
        foregroundColor: Color(0xff1C2A3A),
        fixedSize: Size(400, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(50),
          side: BorderSide(color: Color(0xffE5E7EB), width: 2),
        ),
        minimumSize: Size(double.infinity, 41),
      ),
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: Color(0xffF9F9F8),
      titleTextStyle: TextStyle(
        color: Color(0xff45496a),
        fontSize: 24,
        fontWeight: FontWeight(700),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Color(0xffc4e1f6),
        fontSize: 28,
        fontWeight: FontWeight(700),
      ),
      titleMedium: TextStyle(
        color: Color(0xff45496a),
        fontSize: 24,
        fontWeight: FontWeight(600),
      ),
      titleSmall: TextStyle(
        color: Color(0xff45496a),
        fontSize: 20,
        fontWeight: FontWeight(600),
      ),
      bodyLarge: TextStyle(
        color: Color(0xfff596a1),
        fontSize: 16,
        fontWeight: FontWeight(600),
      ),
      bodyMedium: TextStyle(
        color: Color(0xff3E4949),
        fontSize: 14,
        fontWeight: FontWeight(400),
      ),
      bodySmall: TextStyle(
        color: Color(0xff45496a),
        fontSize: 12,
        fontWeight: FontWeight(600),
      ),
    ),
  );
}
