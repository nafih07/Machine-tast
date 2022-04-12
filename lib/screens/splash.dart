import 'dart:async';
import 'package:flutter/material.dart';
import 'package:machine_test/helper/helper.dart';
import 'package:machine_test/screens/user_list.dart';
import 'package:machine_test/screens/login.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String token;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white, body: _checkUserStatus());
  }

  startTimer() async => Timer(Duration(seconds: 4), () => {});

  _checkUserStatus() async {
    String? token = await SharedPreferenceHelper.shared.getString();
    if (token != null)
      Screens.pushReplacement(context, UserList());
    else
      Screens.pushReplacement(context, Login());
  }
}
