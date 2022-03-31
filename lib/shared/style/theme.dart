import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData themeLite = ThemeData(

  textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      )),
  primarySwatch: Colors.green,
  scaffoldBackgroundColor: Colors.grey.shade50,
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.blue),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.grey.shade50,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
  ),
);

ThemeData themeDark = ThemeData(
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      )),
  primarySwatch: Colors.red,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
);