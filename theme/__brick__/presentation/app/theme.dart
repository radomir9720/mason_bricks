import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: always_use_package_imports
import 'ui.dart';

mixin MaterialTheme {
  static ThemeData from(AppColorsData colors) {
    return ThemeData(
      brightness: colors.brightness.when(
        light: () => Brightness.light,
        dark: () => Brightness.dark,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      //
      dividerTheme: const DividerThemeData(
        space: 1,
      ),
      canvasColor: colors.background,
      backgroundColor: colors.background,
      dialogBackgroundColor: colors.background,
      scaffoldBackgroundColor: colors.background,
      bottomAppBarColor: colors.appBarColor,
      //
      errorColor: colors.error,
      disabledColor: colors.background[5],
      //
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: colors.brightness.when(
          light: () => Brightness.light,
          dark: () => Brightness.dark,
        ),
        primary: colors.primary,
        onPrimary: colors.onPrimary,
        secondary: colors.primary,
        onSecondary: colors.onPrimary,
        error: colors.error,
        onError: colors.onError,
        surface: colors.surface,
        onSurface: colors.onSurface,
        background: colors.background,
        onBackground: colors.onBackground,
      ),
      //
      primaryColor: colors.primary,
      //
      shadowColor: colors.background[20],
      //
      dividerColor: colors.background[10],
      //
      textTheme: TextTheme(
        // default TextField
        headline3: TextStyle(
          height: 1.17,
          fontSize: 18,
          letterSpacing: 0.25,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          color: colors.text,
        ),
        bodyText2: TextStyle(
          fontSize: 14.fo,
        ),
        subtitle1: TextStyle(
          fontSize: 14.fo,
        ),
      ),
      //
      iconTheme: IconThemeData(
        size: 16.si,
      ),
      //
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(colors.primary),
      ),
      //
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.si,
        ),
        minVerticalPadding: 10.si,
      ),
      //
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight.si,
        centerTitle: true,
        color: colors.appBarColor,
        systemOverlayStyle: colors.brightness.when(
          dark: () => SystemUiOverlayStyle.light,
          light: () => SystemUiOverlayStyle.dark,
        ),
        iconTheme: IconThemeData(
          size: 20.si,
          color: colors.text,
        ),
        titleTextStyle: TextStyle(
          height: 1.17,
          fontSize: 18.fo,
          color: colors.text,
          letterSpacing: .25,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
        ),
      ),
      //
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(colors.primary),
        trackColor: MaterialStateProperty.all(colors.primary.withOpacity(.4)),
      ),
      //
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          onPrimary: colors.onPrimary,
          textStyle: TextStyle(
            height: 1.6,
            fontSize: 16.fo,
            letterSpacing: .15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
          ),
          primary: colors.primary,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            vertical: 12.si,
            horizontal: 16.si,
          ),
        ),
      ),
      //
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontSize: 12.fo,
            fontWeight: FontWeight.w700,
          ),
          padding: EdgeInsets.all(8.si),
        ),
      ),
      //
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(16),
        labelStyle: TextStyle(
          fontSize: 16,
          letterSpacing: .15,
          color: colors.text[400],
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
        ),
        suffixStyle: TextStyle(
          color: colors.text[500],
        ),
        prefixStyle: TextStyle(
          color: colors.text[500],
        ),
        hintStyle: TextStyle(
          height: 1.25,
          fontSize: 16,
          letterSpacing: 0.15,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          color: colors.text[400],
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.background[30]!,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.background[30]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.background[30]!,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.background[30]!,
          ),
        ),
      ),
    );
  }
}
