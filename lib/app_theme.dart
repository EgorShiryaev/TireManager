import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final _subtitle1Style = GoogleFonts.roboto(fontSize: 32);

  static final _subtitle2Style = GoogleFonts.roboto(fontSize: 20);

  static final _captionStyle = GoogleFonts.roboto(
    fontSize: 16,
    color: Colors.black,
  );

  static final _buttonStyle = GoogleFonts.roboto(
    fontSize: 16,
  );

  static const _secondaryColor = Colors.white;
  static const _primaryColor = Colors.green;

  static const textFieldFillColor = Color.fromARGB(255, 243, 243, 243);

  static const filledCardDecoration = BoxDecoration(
    color: AppTheme.textFieldFillColor,
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  final light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      onPrimary: _secondaryColor,
      secondary: _secondaryColor,
      onSecondary: _primaryColor,
      shadow: Colors.grey,
      surface: Colors.white,
      error: Colors.red,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: _subtitle2Style.copyWith(color: _primaryColor),
      color: _secondaryColor,
      foregroundColor: _primaryColor,
    ),
    dividerColor: Colors.grey.shade700,
    highlightColor: Colors.grey.shade100,
    textTheme: TextTheme(
      subtitle1: _subtitle1Style,
      subtitle2: _subtitle2Style,
      caption: _captionStyle,
      button: _buttonStyle,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black12,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: textFieldFillColor,
      hintStyle: _captionStyle.copyWith(color: Colors.grey.shade700),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _primaryColor,
        fixedSize: const Size.fromHeight(55),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryColor,
      foregroundColor: _secondaryColor,
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: _primaryColor, width: 2),
        ),
      ),
      labelColor: _primaryColor,
      labelStyle: _captionStyle,
      unselectedLabelColor: _primaryColor,
      unselectedLabelStyle: _captionStyle,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _primaryColor,
      contentTextStyle: _captionStyle.copyWith(color: _secondaryColor),
    ),
  );
}
