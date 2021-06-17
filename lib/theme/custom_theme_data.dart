import 'package:flutter/material.dart';

class CustomThemeData {
  static const Color foregrounColor = const Color.fromRGBO(225, 225, 225, 1);
  static const Color subForegroundColor =
      const Color.fromRGBO(188, 188, 188, 1);

  static const Color backgoundColor = const Color.fromRGBO(60, 60, 60, 1);
  static const Color subBackgoundColor = const Color.fromRGBO(30, 30, 30, 1);

  static ThemeData themedata = ThemeData(
      brightness: Brightness.dark,
      backgroundColor: subBackgoundColor,
      cardColor: backgoundColor,
      scaffoldBackgroundColor: subBackgoundColor,
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
      fontFamily: "ProximaNova",
      appBarTheme: AppBarTheme(
        backgroundColor: backgoundColor,
        actionsIconTheme: IconThemeData(color: foregrounColor),
      ),
      primaryTextTheme: const TextTheme(
        bodyText1: TextStyle(color: foregrounColor, fontSize: 24),
        bodyText2:
            TextStyle(fontFamily: "Etna", color: foregrounColor, fontSize: 16),
        subtitle2: TextStyle(color: subForegroundColor),
        subtitle1: TextStyle(color: subForegroundColor, fontSize: 18),
        headline3: TextStyle(fontFamily: "Etna", color: foregrounColor),
        headline4: TextStyle(fontFamily: "Etna", color: foregrounColor),
        headline5: TextStyle(fontFamily: "Etna", color: foregrounColor),
        headline6: TextStyle(fontFamily: "Etna", color: foregrounColor),
      ),
      iconTheme: IconThemeData(color: foregrounColor),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(backgoundColor),
              elevation: MaterialStateProperty.all<double>(0))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(backgoundColor),
              elevation: MaterialStateProperty.all<double>(0))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: backgoundColor,
          foregroundColor: foregrounColor,
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
          fillColor: backgoundColor,
          filled: true));
}