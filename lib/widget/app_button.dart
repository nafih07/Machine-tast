import 'package:machine_test/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final String? svgIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final double? fontSize;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final bool isEnabled;

  const AppButton(
      {Key? key,
      this.text,
      this.icon,
      this.svgIcon,
      this.backgroundColor,
      this.textColor,
      this.iconColor,
      this.borderColor,
      this.borderRadius,
      this.width,
      this.height,
      this.fontSize,
      this.textStyle,
      this.isEnabled = true,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            width: 200,
            height: height??50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    borderRadius != null ? borderRadius! : 5),
                color: backgroundColor??AppColors.three),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null)
                    Icon(icon,
                        color: iconColor != null ? iconColor : Colors.white,
                        size: 25),
                  if (svgIcon != null) SvgPicture.asset(svgIcon!),
                  if ((svgIcon != null || icon != null) &&
                      text != null &&
                      text!.isNotEmpty)
                    SizedBox(width: 16),
                  if (text != null)
                    Text(text!,
                        style: textStyle ??
                            AppTextStyles.mediumTextStyle(
                                fontSize != null ? fontSize! : 16,
                                textColor != null
                                    ? textColor!
                                    : Colors.white))
                ])));
  }
}
