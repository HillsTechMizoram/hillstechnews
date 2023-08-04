import 'package:flutter/material.dart';

// Define the light theme
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  useMaterial3: true,
  //textButtonTheme:  TextButtonThemeData(style: ButtonStyle(iconColor: )),
  appBarTheme: const AppBarTheme(scrolledUnderElevation: 4),
  colorScheme: const ColorScheme.light(
    primary: Colors.white, // Primary variant color
    secondary: Colors.white, // Secondary variant color
    surface: Colors.white, // Surface color
    background: Colors.white, // Background color
    error: Colors.red, // Error color
    onPrimary: Colors.black, // On primary color (text color on primary)
    onSecondary: Colors.black, // On secondary color (text color on secondary)
    onSurface: Colors.black, // On surface color (text color on surface)
    onBackground:
        Colors.black, // On background color (text color on background)
    onError: Colors.white, // On error color (text color on error)
    brightness: Brightness.light,
    // Brightness (light/dark)
  ),
);

// Define the dark theme
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.indigo,
  useMaterial3: true,
);
