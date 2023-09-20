import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:http/http.dart' as http;

import '../../data/repositry/repositry.dart';
import '../models/password.dart';
import '../models/username.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {

     var result=   await _authenticationRepository.logIn(
          username: state.username.value,
          password: state.password.value,
        );
     if(result=="200"){
       emit(state.copyWith(status: FormzSubmissionStatus.success));

     }else{
       emit(state.copyWith(status: FormzSubmissionStatus.failure));

     }
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

}
//
// enum AuthenticationStatus { unknown, authenticated, unauthenticated }
//
// class AuthenticationRepository2 {
//   final _controller = StreamController<AuthenticationStatus>();
//
//   Stream<AuthenticationStatus> get status async* {
//     await Future<void>.delayed(const Duration(seconds: 1));
//     yield AuthenticationStatus.unauthenticated;
//     yield* _controller.stream;
//   }
//
//   logIn({
//     required String username,
//     required String password,
//   }) async {
//     var map = {
//       "username": "kminchelle",
//       "password": "0lelplR",
//     };
//     final response = await http
//         .post(Uri.parse("https://dummyjson.com/auth/login"), body: map);
//     if (response.statusCode == 200) {
//       _controller.add(AuthenticationStatus.authenticated);
//       debugPrint(response.body.toString());
//
//       return response.statusCode.toString();
//     } else {
//       print("Exception");
//       throw Exception();
//     }
//     await Future.delayed(
//       const Duration(milliseconds: 300),
//           () => _controller.add(AuthenticationStatus.authenticated),
//     );
//   }
// }
