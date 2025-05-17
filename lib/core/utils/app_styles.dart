import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  // Headings
  static TextStyle headline1(BuildContext context) => GoogleFonts.poppins(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.headlineLarge?.color,
      );

  static TextStyle headline2(BuildContext context) => GoogleFonts.poppins(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.headlineMedium?.color,
      );

  static TextStyle headline3(BuildContext context) => GoogleFonts.poppins(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.headlineSmall?.color,
      );

  // Subtitles
  static TextStyle subtitle1(BuildContext context) => GoogleFonts.poppins(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).textTheme.titleMedium?.color,
      );

  static TextStyle subtitle2(BuildContext context) => GoogleFonts.poppins(
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).textTheme.titleSmall?.color,
      );

  // Body text
  static TextStyle body1(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      );

  static TextStyle body2(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).textTheme.bodyMedium?.color,
      );

  // Caption & overline
  static TextStyle caption(BuildContext context) => GoogleFonts.poppins(
        fontSize: 12.0,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).textTheme.bodySmall?.color,
      );

  static TextStyle overline(BuildContext context) => GoogleFonts.poppins(
        fontSize: 10.0,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).textTheme.labelSmall?.color,
      );

  // Button
  static TextStyle button(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.labelLarge?.color,
      );

  // Link
  static TextStyle link(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.primary,
        decoration: TextDecoration.underline,
      );
}
