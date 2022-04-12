import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:machine_test/helper/helper.dart';
import 'package:machine_test/model/model.dart';
import 'package:machine_test/network/network.dart';

class UserService extends StateNotifier<User> {
  UserService() : super(new User());


  Future loginUser(
      {required BuildContext context,
      required String email,
      required String password,
      required Function onSuccess,
      required Function onError}) async {
    try {
      Map<String, String> params = {"email": email, "password": password};
      Response response = await NetworkAdapter.shared
          .post(endPoint: Endpoints.loginURL, params: params);
      SharedPreferenceHelper.shared.setString(response.data['token']);
      onSuccess();
    } catch (error) {
      onError(error.toString());
    }
  }

  Future SignIn(
      {required BuildContext context,
      required String email,
      required String password,
      required Function onSuccess,
      required Function(String error)? onresponseError}) async {
    try {
      Map<String, String> params = {"email": email, "password": password};
      Response response = await NetworkAdapter.shared
          .post(endPoint: Endpoints.signIn, params: params);
      onSuccess();
    } catch (error) {
      onresponseError!(error.toString());
    }
  }
}
