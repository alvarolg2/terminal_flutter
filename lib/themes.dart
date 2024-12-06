import 'package:flutter/material.dart';

class AppColors {
   //light
  MaterialColor lightPrimaryColor = Colors.pink;
  MaterialColor lightSecondaryColor = Colors.pink;

  static const Color appbarLight =  Colors.pink;
  static const Color iconsAppLight = Colors.white;
  
  MaterialColor elevatedButtonBackgroundColorLight = Colors.blue;
  Color elevatedButtonTextColorLight = Colors.white;

  //dark
  MaterialColor darkPrimaryColor = Colors.pink;
  MaterialColor darkSecondaryColor = Colors.pink;

  static const Color appbarDark =  Color.fromRGBO(55, 51, 64, 100);
  static const Color iconsAppDark = Colors.white;

  MaterialColor elevatedButtonBackgroundColorDark = Colors.blue;
  Color elevatedButtonTextColorDark = Colors.white;
}
class ThemeClass{

  //light
  MaterialColor lightPrimaryColor = Colors.pink;
  MaterialColor lightSecondaryColor = Colors.pink;
  static const Color appbarLight =  Colors.pink;
  //dark
  MaterialColor darkPrimaryColor = Colors.pink;
  MaterialColor darkSecondaryColor = Colors.pink;
  static const Color appbarDark =  Color.fromRGBO(55, 51, 64, 100);

  MaterialColor elevatedButtonBackgroundColor = Colors.blue; // Cambia esto a tu color deseado
  Color elevatedButtonTextColor = Colors.white; // Cambia esto a tu color deseado

  

  static ThemeData lightTheme = ThemeData(
        useMaterial3: true,
        //Se indica que el tema tiene un brillo luminoso/claro
        brightness: Brightness.light,
        iconTheme: const IconThemeData(color: Colors.black),
        primarySwatch: _themeClass.lightPrimaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        )));
  static ThemeData darkTheme = ThemeData(
        useMaterial3: true,
        //Se indica que el tema tiene un brillo luminoso/claro
        brightness: Brightness.dark,
        iconTheme: const IconThemeData(color: Colors.black),
        primarySwatch: _themeClass.darkPrimaryColor,
      );
}

ThemeClass _themeClass = ThemeClass();