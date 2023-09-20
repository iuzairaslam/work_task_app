import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const FlutterLogo(
              //   size: 150,
              // ),
              Icon(Icons.handshake, color: Colors.blue.shade600, size: 100,),
              const Padding(padding: EdgeInsets.all(12)),
              const Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(text: 'You can use any user\'s credentials from '),
                    TextSpan(
                      text: '\ndummyjson.com/users',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.all(12)),
              const Text(

                  "Prefer to use: \nUsername: kminchelle\nPassword: 0lelplR",

              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.4
              ),),
              const Padding(padding: EdgeInsets.all(12)),
              _UsernameInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _PasswordInput(),
              const Padding(padding: EdgeInsets.all(12)),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            labelText: 'Username',
            errorText:
                state.username.displayError != null ? 'invalid username' : null,
            fillColor: Colors.white70,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            labelText: 'Password',
            errorText:
                state.username.displayError != null ? 'invalid password' : null,
            fillColor: Colors.white70,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('loginForm_continue_raisedButton'),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: const Size(double.infinity, 60),
                      backgroundColor: Colors.blue.shade400),
                  onPressed: state.isValid
                      ? () {
                          context.read<LoginBloc>().add(const LoginSubmitted());
                        }
                      : null,
                  child: const Text('Login'),
                ),
              );
      },
    );
  }
}
