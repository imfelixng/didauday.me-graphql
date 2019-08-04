import 'dart:async';

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


  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

}
