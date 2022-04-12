import 'package:machine_test/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:machine_test/widget/widget.dart';
import 'package:intl/intl.dart';

class GenericFunctions {
  static showToastBar(String message, BuildContext context) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.primaryTextColor,
        textColor: Colors.white);
  }
}
