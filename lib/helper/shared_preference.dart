import 'dart:convert';

import 'package:machine_test/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // Singleton
  static final SharedPreferenceHelper shared =
      SharedPreferenceHelper._privateConstructor();

  SharedPreferenceHelper._privateConstructor();

  // Keys
  final String _token = "token";
  final String lastUpdatedTime = "last_updated_time";
  final String _startUp = "start_up";


  Future setString( String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_token, value!);
  }

  Future<String?> getString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }
}
