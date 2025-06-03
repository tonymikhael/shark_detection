import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  // Headings
  static TextStyle headline1(BuildContext context) => GoogleFonts.amarante(
        fontSize: 32.0.sp,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.headlineLarge?.color,
      );

  static TextStyle headline2(BuildContext context) => GoogleFonts.amarante(
        fontSize: 28.0.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.headlineMedium?.color,
      );

  static TextStyle headline3(BuildContext context) => GoogleFonts.amarante(
        fontSize: 24.0.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.headlineSmall?.color,
      );

  // Subtitles
  static TextStyle subtitle1(BuildContext context) => GoogleFonts.amarante(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.titleMedium?.color,
      );

  static TextStyle subtitle2(BuildContext context) => GoogleFonts.amarante(
        fontSize: 18.0.sp,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).textTheme.titleSmall?.color,
      );

  // Body text
  static TextStyle body1(BuildContext context) => GoogleFonts.amarante(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      );

  static TextStyle body2(BuildContext context) => GoogleFonts.amarante(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      );

  // Caption & overline
  static TextStyle caption(BuildContext context) => GoogleFonts.amarante(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).textTheme.bodySmall?.color,
      );

  static TextStyle overline(BuildContext context) => GoogleFonts.amarante(
        fontSize: 10.0.sp,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).textTheme.labelSmall?.color,
      );

  // Button
  static TextStyle button(BuildContext context) => GoogleFonts.amarante(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.labelLarge?.color,
      );

  // Link
  static TextStyle link(BuildContext context) => GoogleFonts.amarante(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary,
        decoration: TextDecoration.underline,
      );
}
