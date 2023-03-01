import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightmode=ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme:const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle:  TextStyle(color: Colors.black,fontFamily: 'jannah',fontSize: 20),
      iconTheme:  IconThemeData(color: Colors.black,size: 30.0)
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      backgroundColor: Colors.white,
      elevation: 0.0
  ),
  textTheme: const TextTheme(
    bodyText1:  TextStyle(
        fontSize: 20.0,
        color: Colors.black
    ),
  ),
);


ThemeData darkmode=ThemeData(
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light
      ),
      elevation: 0.0,
      titleTextStyle:  TextStyle(color: Colors.white),
      iconTheme:  IconThemeData(color: Colors.white,size: 30.0)

  ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    elevation: 20.0,
    unselectedItemColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyText1:  TextStyle(
        fontSize: 20.0,
        color: Colors.white
    ),
  ),

);