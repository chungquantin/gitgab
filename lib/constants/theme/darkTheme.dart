import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
    primaryColor: HexColor("#121212"),
    accentColor: Colors.deepPurple,
    secondaryHeaderColor: HexColor("#1D1D1D"),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: HexColor("#1D1D1D"),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700]),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.grey[100], fontSize: 17),
      bodyText1: TextStyle(
          color: Colors.grey[600], fontSize: 15, fontWeight: FontWeight.normal),
      bodyText2: TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.normal),
    ));
