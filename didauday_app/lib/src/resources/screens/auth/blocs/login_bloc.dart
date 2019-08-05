import 'dart:async';

import 'package:didauday_app/src/resources/screens/auth/firebase/firebase_auth.dart';

import '../validators/login_validate.dart';

class LoginBloc {
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValidDataLogin(String email, String password) {

    if (!LoginValidate.isValidEmail(email)) {
      _emailController.sink.addError("Email is invalid");
      return false;
    }
    _emailController.sink.add("");

    if (!LoginValidate.isValidPass(password)) {
      _passwordController.sink.addError("Password is invalid");
      return false;
    }
    _passwordController.sink.add("");

    return true;

  }

  Future onLogin(String email, String password) {
    FBAuth fbAuth = FBAuth();
    return fbAuth.login(email, password);
  }

  Future onLoginWithGoogle() {
    FBAuth fbAuth = FBAuth();
    return fbAuth.loginWithGoogle();
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

}
