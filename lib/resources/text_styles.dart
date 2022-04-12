import 'package:flutter/material.dart';

class AppTextStyles {
  static String poppinsFamily = "Poppins";

  static TextStyle lightTextStyle(double fontSize, Color color) {
    return new TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        fontFamily: poppinsFamily);
  }

  static TextStyle regularTextStyle(double fontSize, Color color) {
    return new TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontFamily: poppinsFamily);
  }

  static TextStyle mediumTextStyle(double fontSize, Color color) {
    return new TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontFamily: poppinsFamily);
  }

  static TextStyle semiBoldTextStyle(double fontSize, Color color) {
    return new TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontFamily: poppinsFamily);
  }

  static TextStyle boldTextStyle(double fontSize, Color color) {
    return new TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontFamily: poppinsFamily);
  }
}
