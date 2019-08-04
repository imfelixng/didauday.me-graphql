import 'dart:async';

import 'package:didauday_app/src/resources/screens/auth/firebase/firebase_auth.dart';
import 'package:didauday_app/src/resources/screens/auth/validators/forgot_password_validate.dart';

class ForgotPasswordBloc {
  StreamController _emailController = new StreamController();

  Stream get emailStream => _emailController.stream;

  bool isValidDataReset(String email) {

    if (!ForgotPasswordValidate.isValidEmail(email)) {
      _emailController.sink.addError("Email is invalid");
      return false;
    }

    _emailController.sink.add("");
    return true;
  }

  Future onResetPassword(String email) async {
    FBAuth fbAuth = FBAuth();
    return await fbAuth.resetPassword(email);
  }

  void dispose() {
    _emailController.close();
  }

}
