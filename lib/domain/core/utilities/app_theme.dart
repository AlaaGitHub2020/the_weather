import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_weather/domain/core/utilities/colors.dart';

class AppTheme {
  const AppTheme._();

  static final _lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColor,
      background: AppColors.whiteColor1,
      error: AppColors.errorColor,
    ),
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    disabledColor: AppColors.grayColor1,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor1,
      hintStyle: GoogleFonts.montserrat(
        color: AppColors.primaryColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.secondaryColor.withOpacity(0.35),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.secondaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge:  GoogleFonts.montserrat(
        fontSize: 30,
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 22,
        color: AppColors.blackColor1,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: AppColors.blackColor1,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.primaryColor,
        ),
      ),
    ),
  );

  static final _darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondaryColor,
        background: AppColors.blackColor1,
        error: AppColors.errorColor),
    brightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    disabledColor: AppColors.grayColor1,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.montserrat(
        color: AppColors.primaryColor,
      ),
      filled: true,
      fillColor: AppColors.blackColor1,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.secondaryColor.withOpacity(0.35),
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.secondaryColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.errorColor,
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge:  GoogleFonts.montserrat(
        fontSize: 30,
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 22,
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w300,
        fontSize: 16,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w300,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: AppColors.whiteColor1,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.primaryColor,
        ),
      ),
    ),
  );

  static ThemeData light() {
    return _lightTheme;
  }

  static ThemeData dark() {
    return _darkTheme;
  }
}
