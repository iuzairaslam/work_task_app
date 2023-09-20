import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/user_post_model.dart';

class UserRepository2 {
  @override
  Future<List<UserPostModel>> getRestaurantData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      List<UserPostModel> result = List<UserPostModel>.from(
          jsonDecode(response.body)
              .map((model) => UserPostModel.fromJson(model)));

      return result;
    } else {
      print("Exception");
      throw Exception();
    }
  }

  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    var map = {
      "username": username,
      "password": password,
    };
    final response = await http
        .post(Uri.parse("https://dummyjson.com/auth/login"), body: map);
    if (response.statusCode == 200) {
      debugPrint(response.body.toString());

      return response.statusCode.toString();
    } else {
      print("Exception");
      throw Exception();
    }
  }
}
