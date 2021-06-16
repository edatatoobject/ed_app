import 'package:flutter/material.dart';

class CustomThemeData {
  static ThemeData themedata = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
    cardColor: const Color.fromRGBO(60, 60, 60, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(30, 30, 30, 1),
    primaryColor: Colors.orange,
    accentColor: Colors.orangeAccent,
    fontFamily: "ProximaNova",
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromRGBO(60, 60, 60, 1),
      actionsIconTheme:
          IconThemeData(color: const Color.fromRGBO(225, 225, 225, 1)),
    ),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(
          color: const Color.fromRGBO(225, 225, 225, 1), fontSize: 24),
      bodyText2: TextStyle(
          fontFamily: "Etna",
          color: const Color.fromRGBO(225, 225, 225, 1),
          fontSize: 16),
      subtitle2: TextStyle(color: const Color.fromRGBO(188, 188, 188, 1)),
      subtitle1: TextStyle(
          color: const Color.fromRGBO(188, 188, 188, 1), fontSize: 18),
      headline3: TextStyle(
          fontFamily: "Etna", color: const Color.fromRGBO(225, 225, 225, 1)),
      headline4: TextStyle(
          fontFamily: "Etna", color: const Color.fromRGBO(225, 225, 225, 1)),
      headline5: TextStyle(
          fontFamily: "Etna", color: const Color.fromRGBO(225, 225, 225, 1)),
      headline6: TextStyle(
          fontFamily: "Etna", color: const Color.fromRGBO(225, 225, 225, 1)),
    ),
    iconTheme: IconThemeData(color: const Color.fromRGBO(225, 225, 225, 1)),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(60, 60, 60, 1)),
            elevation: MaterialStateProperty.all<double>(0))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromRGBO(60, 60, 60, 1)),
            elevation: MaterialStateProperty.all<double>(0))),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color.fromRGBO(60, 60, 60, 1),
        foregroundColor: const Color.fromRGBO(225, 225, 225, 1),
        elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: new BorderSide(style: BorderStyle.none)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        fillColor: const Color.fromRGBO(60, 60, 60, 1),
        filled: true));
}


