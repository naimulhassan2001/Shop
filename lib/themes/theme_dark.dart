import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,


  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white),

  iconTheme: const IconThemeData(color: Colors.white),

  floatingActionButtonTheme:
  const FloatingActionButtonThemeData(backgroundColor: Colors.blue),
);