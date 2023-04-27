import 'package:flutter/material.dart';

ThemeData themeData(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Avenir',
    textTheme: textTheme()
  );
}

TextTheme textTheme(){
  return const TextTheme(
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),
      displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
      headlineMedium: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold
      ),
      headlineSmall: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.bold
      ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.bold
      )

 );
}