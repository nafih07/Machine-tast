import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_test/resources/resources.dart';

class AppStyles {

  static InputDecoration labelInputDecoration(
      {String? label,
      String? prefix,
      Color? color,
      Color? fillColor,
      Widget? prefixIcon,
      double? hintSize,
      double? radius,
      TextStyle? textStyle}) {
    return InputDecoration(
        filled: false,
        fillColor: fillColor ?? AppColors.three,
        prefixText: prefix,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        contentPadding: EdgeInsets.fromLTRB(17.0, 20, 0, 20.0),
        hintText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: prefixIcon,
        ),
        labelStyle: textStyle != null
            ? textStyle
            : AppTextStyles.regularTextStyle(
                hintSize ?? 14, color ?? AppColors.primaryTextColor),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none);
  }

  static InputDecoration noBorderInputDecoration(String? hint) {
    return InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(12, 3, 4, 0),
        focusColor: Colors.grey[300],
        hintText: hint,
        hintStyle: AppTextStyles.regularTextStyle(14, AppColors.hintColor),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: AppColors.lightGrey, width: .5)),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: AppColors.lightGrey, width: .5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: AppColors.lightGrey, width: .5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: AppColors.lightGrey, width: .5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: AppColors.lightGrey, width: .5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.red)));
  }
}
