import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  // Main color scheme
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    primary: Colors.green,
    secondary: Colors.greenAccent,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 97, 177, 243),
    foregroundColor: Colors.black,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),

  // Radio Button Theme
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.all(Colors.green)
  ),

  // Dropdown Menu Theme
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      surfaceTintColor: MaterialStateProperty.all(Colors.green.shade50),
    ),
  ),

  // TextFormField Theme
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blueGrey),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    labelStyle: const TextStyle(color: Colors.black54),
  
  ),
  //
  // // Card Theme
  // cardTheme: CardTheme(
  //   color: Colors.white,
  //   elevation: 3,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     side: const BorderSide(color: Colors.green, width: 0.8),
  //   ),
  //   margin: const EdgeInsets.all(8),
  // ),

  // ListTile Theme
  listTileTheme: const ListTileThemeData(
    tileColor: Colors.white,
    selectedTileColor: Color(0xFFE8F5E9), // light green
    iconColor: Colors.green,
    textColor: Colors.black87,
    selectedColor: Colors.green,
  ),

  // Drawer Theme
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
    scrimColor: Colors.black38,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
  ),

  // FloatingActionButton Theme
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 153, 209, 254),
      foregroundColor: Colors.black,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);


