import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.deepPurple,
    secondaryHeaderColor: Colors.grey[100],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[500]),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 17),
      bodyText1: TextStyle(
          color: Colors.grey[500], fontSize: 15, fontWeight: FontWeight.normal),
      bodyText2: TextStyle(
          color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal),
    ));
