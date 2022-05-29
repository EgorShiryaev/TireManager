import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final _subtitle1Style = GoogleFonts.roboto(
    fontSize: 32,
  );

  static final _subtitle2Style = GoogleFonts.roboto(
    fontSize: 20,
  );

  static final _captionStyle = GoogleFonts.roboto(
    fontSize: 16,
  );

  static final _bodyText1Style = GoogleFonts.roboto(
    fontSize: 16,
  );

  static final _buttonStyle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16,
  );

  static const _secondaryColor = Colors.green;

  static const _textFieldFillColor = Color.fromARGB(255, 243, 243, 243);

  final light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: _secondaryColor,
      secondary: _secondaryColor,
      onSecondary: Colors.white,
      shadow: Colors.grey,
      surface: Colors.white,
      error: Colors.red,
      background: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 70,
    ),
    dividerColor: Colors.grey.shade700,
    highlightColor: Colors.grey.shade100,
    textTheme: TextTheme(
      subtitle1: _subtitle1Style,
      subtitle2: _subtitle2Style,
      caption: _captionStyle,
      bodyText1: _bodyText1Style,
      button: _buttonStyle,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black12,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: _textFieldFillColor,
      hintStyle: _captionStyle,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _secondaryColor,
        fixedSize: const Size.fromHeight(55),
      ),
    ),
  );
}
