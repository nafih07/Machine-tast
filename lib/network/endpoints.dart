import 'package:machine_test/model/model.dart';

class Endpoints {
  static String baseURL = "https://reqres.in/";

  static setBaseURL(String url) {
    baseURL = url;
  }

  //API urls
  static final loginURL = "${baseURL}api/login";
  static final signIn = "${baseURL}api/register";
  static final fetchList = "${baseURL}api/users?delay=2";

}
