// flutter packages
import 'package:flutter/material.dart';

// pub packages
import 'package:google_fonts/google_fonts.dart';
import 'package:qrapp/src/themes/textformfield_theme.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isLightTheme = true;

  ThemeMode get currentTheme =>
      _isLightTheme ? ThemeMode.light : ThemeMode.dark;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: const TextStyle(
          fontSize: 21,
          color: Color(0xFF303030),
          wordSpacing: 0,
        ),
        labelStyle: const TextStyle(
          fontSize: 18,
          color: Color(0xFF8F6146),
          wordSpacing: 0,
        ),
        isDense: true,
        focusColor: const Color(0xFF8F6146),
        alignLabelWithHint: true,
        errorMaxLines: 0,
        errorStyle: const TextStyle(
          fontSize: 0,
          color: Colors.transparent,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF303030),
            width: 3,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(60),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFF303030),
            width: 3,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(60),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 3.0,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          gapPadding: 3.0,
        ),
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: const Color(0xFF8F6146),
        ),
        color: const Color(0xFFF3F3F3),
        elevation: 3,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: const Color(0xFF8F6146),
        ),
      ),
      shadowColor: const Color(0xff303030),
      primaryColor: const Color(0xFF8F6146),
      backgroundColor: const Color(0xfff3f3f3),
      scaffoldBackgroundColor: const Color(0xfff3f3f3),
      iconTheme: IconThemeData(
        color: const Color(0xFF8F6146),
        size: 24,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 3,
        backgroundColor: const Color(0xCCBE9279),
        type: BottomNavigationBarType.shifting,
        enableFeedback: true,
        selectedIconTheme: IconThemeData(
          color: const Color(0xFF8F6146),
          size: 30,
        ),
        unselectedIconTheme: IconThemeData(
          color: const Color(0x99303030),
          size: 30,
        ),
        showUnselectedLabels: false,
        showSelectedLabels: false,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: const Color(0xff303030),
        ),
        headline2: TextStyle(
          color: const Color(0xff303030),
        ),
        headline3: TextStyle(
          color: const Color(0xff303030),
        ),
        headline4: TextStyle(
          color: const Color(0xff303030),
        ),
        headline5: TextStyle(
          color: const Color(0xff303030),
        ),
        headline6: TextStyle(
          color: const Color(0xff303030),
        ),
        subtitle1: TextStyle(
          color: const Color(0xff303030),
        ),
        subtitle2: TextStyle(
          color: const Color(0xff303030),
        ),
        bodyText1: TextStyle(
          color: const Color(0xff303030),
        ),
        bodyText2: TextStyle(
          color: const Color(0xff303030),
        ),
        caption: TextStyle(
          color: const Color(0xff303030),
        ),
        button: TextStyle(
          color: const Color(0xff303030),
        ),
        overline: TextStyle(
          color: const Color(0xff303030),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: const Color(0xFF8F6146),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
