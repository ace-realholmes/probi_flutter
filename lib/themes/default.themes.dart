import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF3A445D),
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Color(0xFF5E5768),
    // foregroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  ),
  textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
      )),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Color(0xFFD9D9D9),
    filled: true,
    border: const UnderlineInputBorder(),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    labelStyle: TextStyle(color: Colors.black),
    hintStyle: TextStyle(color: Colors.grey.shade600),
  ),
  iconButtonTheme:  IconButtonThemeData(
    style: IconButton.styleFrom(
      
    )
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF3A445D),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF5D737E),
    shape: CircleBorder(
      side: BorderSide.none
    )
  ),
);
