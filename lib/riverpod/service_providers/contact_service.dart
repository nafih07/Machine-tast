import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:machine_test/model/model.dart';
import 'package:machine_test/network/network.dart';

class ContactService extends StateNotifier<List<User>> {
  ContactService() : super([]);

  Future fetchUsers({
    required Function(String value) onComplete}) async {
    try {
      Response response =
          await NetworkAdapter.shared.get(endPoint: Endpoints.fetchList);
      List<User>? userList = [];
      if (response.statusCode == 200) {
        userList = List<User>.from(response.data['data'].map((x) => User.fromJson(x)));
      }
      state = userList;
      onComplete(response.statusMessage ?? "");
    } catch (error) {
      onComplete(error.toString());
    }
  }
}
