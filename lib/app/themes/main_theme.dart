import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.amber,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColor: Colors.amber,
  accentColor: Colors.purple[100],
  buttonTheme: ButtonThemeData(buttonColor: Colors.amber[800]),
  //canvasColor: Colors.purple[100],
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    button: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
);
