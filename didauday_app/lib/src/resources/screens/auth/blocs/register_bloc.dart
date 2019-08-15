import 'dart:async';

import 'package:didauday_app/src/resources/screens/auth/firebase/firebase_auth.dart';
import 'package:didauday_app/src/resources/screens/auth/validators/register_validate.dart';


class RegisterBloc {
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _confirmPasswordController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get confirmPasswordStream => _confirmPasswordController.stream;



  bool isValidDataRegister(
      String email, String password, String confirmPassword,
  ) {

    if (!RegisterValidate.isValidEmail(email)) {
      _emailController.sink.addError("Email is invalid");
      return false;
    }
    _emailController.sink.add("");

    if (!RegisterValidate.isValidPass(password)) {
      _passwordController.sink.addError("Password is invalid");
      return false;
    }
    _passwordController.sink.add("");

    if (!RegisterValidate.isValidConfirmPassword(password, confirmPassword)) {
      _confirmPasswordController.sink.addError("Password is not match");
      _passwordController.sink.addError("Password is not match");
      return false;
    }

    _confirmPasswordController.sink.add("");
    _passwordController.sink.add("");

    return true;

  }


  Future onRegister(String email, String password) {


    FBAuth fbAuth = FBAuth();
    return fbAuth.register(email, password);
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();
  }

}
