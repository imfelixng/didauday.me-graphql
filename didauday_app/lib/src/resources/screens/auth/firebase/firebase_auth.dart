import 'package:firebase_auth/firebase_auth.dart';


class FBAuth {

  FirebaseAuth _fbAuth = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    var result;
    try {
      result = await _fbAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      throw _errorLogin(error.code);
    }

    return result.user;
  }

  String _errorLogin(String code) {
    var error = '';
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        error  ='The email address is malformed';
        break;
      case 'ERROR_WRONG_PASSWORD':
        error = 'The password is wrong';
        break;
      case 'ERROR_USER_NOT_FOUND':
        error = 'The user not found';
        break;
      case 'ERROR_USER_DISABLED':
        error = 'The user has been disabled';
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        error = 'There was too many attempts to sign in as this user';
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        error = "Can't sign in, please try again";
        break;
      default:
        error = "Can't sign in, please try again";
    }

    return error;
  }

}
