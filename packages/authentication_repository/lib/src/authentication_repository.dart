import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  logIn({
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
      _controller.add(AuthenticationStatus.authenticated);
      debugPrint(response.body.toString());

      return response.statusCode.toString();
    } else {
      print("Exception");
      throw Exception();
    }
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
