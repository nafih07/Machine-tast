import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_test/helper/helper.dart';
import 'package:machine_test/model/model.dart';
import 'package:machine_test/resources/icon.dart';
import 'package:machine_test/resources/resources.dart';
import 'package:machine_test/riverpod/state_providers/state_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? svgIcon;
  final String? title;
  final double? elevation;
  final bool? enableProfile;
  final Color? color;
  final Color? controlColor;
  final VoidCallback? onPressed;
  final bool? isWhite;
  final bool? enableHome;
  final List<Widget>? actions;

  const AppBarWidget(
      {Key? key,
      this.svgIcon,
      this.title,
      this.elevation,
this.actions,
      this.color,
      this.controlColor,
      this.enableProfile = false,
      this.isWhite = true,
      this.enableHome = false,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (context, watch, child) {
        User _currentUser = watch(userProvider);

        return AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: isWhite != null && isWhite!
                    ? Colors.white
                    : Colors.transparent,
                statusBarIconBrightness: isWhite != null && isWhite!
                    ? Brightness.dark
                    : Brightness.light),
            backgroundColor: color ?? Colors.white,
            elevation: elevation != null ? elevation : 0,
            leadingWidth: 45,
            title: Text(title != null ? title! : '',
                style: AppTextStyles.regularTextStyle(
                    20, controlColor ?? AppColors.one)),
            centerTitle: false,
            actions:actions);
      });

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
