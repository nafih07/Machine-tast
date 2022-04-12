import 'package:flutter/material.dart';

class Screens {
  static Future<dynamic> push(BuildContext context, Widget screen) async {
    return await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => screen));
  }

  static void pushCompleteReplacement(BuildContext context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  static void pushReplacement(BuildContext context, Widget screen) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
