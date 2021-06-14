import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_todo_list/store.dart';

class LoginScreen extends StatelessWidget {
  final Store store;
  final void Function()? succeeded;

  const LoginScreen({Key? key, required this.store, this.succeeded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'To Do',
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        return store.loginUser(loginData.name, loginData.password);
      },
      onSignup: (loginData) {
        return store.signUpUser(loginData.name, loginData.password);
      },
      onSubmitAnimationCompleted: succeeded,
      onRecoverPassword: (name) {
        return store.recoverPassword(name);
      },
    );
  }
}
