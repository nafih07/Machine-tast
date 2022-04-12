import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:machine_test/resources/resources.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final bool? autoFocus;
  final Color? color;
  final double? textSize;
  final Color? textColor;
  final String? hint;
  final InputDecoration? inputDecoration;
  final Widget? prefixIcon;

  const AppTextField(
      {Key? key,
      this.prefixIcon,
      required this.controller,
      this.maxLength,
      this.focusNode,
      this.textInputType,
      this.hint,
      this.validator,
      this.maxLines,
      this.textSize,
      this.enabled,
      this.color,
      this.textColor,
      this.textAlign,
      this.autoFocus,
      this.textStyle,
      this.inputDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        enabled: enabled != null ? enabled : true,
        keyboardType:
            textInputType != null ? textInputType : TextInputType.text,
        controller: controller,
        focusNode: focusNode,
        decoration: inputDecoration ??
            AppStyles.labelInputDecoration(
                prefixIcon: prefixIcon,
                label: hint ?? "",
                hintSize: textSize,
                color: color),
        validator: validator,
        textAlign: textAlign != null ? textAlign! : TextAlign.start,
        autofocus: autoFocus != null ? autoFocus! : false,
        maxLines: maxLines != null ? maxLines : 1,
        style: textStyle ??
            AppTextStyles.regularTextStyle(
                textSize ?? 14, textColor ?? AppColors.one),
        maxLength: maxLength);
  }
}
