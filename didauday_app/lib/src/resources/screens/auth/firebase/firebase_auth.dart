import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FBAuth {
  FirebaseAuth _fbAuth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    FirebaseUser user;
    try {
      user = (
          await _fbAuth.signInWithEmailAndPassword(
              email: email, password: password)
      ).user;
    } catch (error) {
      throw _errorLogin(error.code);
    }

    if (user.isEmailVerified)
      return user;
    throw "You must be verified your account.";
  }

  Future<FirebaseUser> loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user = (await _fbAuth.signInWithCredential(credential)).user;
      return user;
    } catch(error) {
      throw _errorLoginSocial(error?.code);
    }
  }

  Future loginWithFacebook() async {
    var fbLogin = FacebookLogin();
    FacebookLoginResult result;
    try {
      print("==================");
      result = await fbLogin.logInWithReadPermissions(
          ['email', 'public_profile']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          var accessToken = result.accessToken;
          print(accessToken.token);
          final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: accessToken.token);
          final FirebaseUser user =(await _fbAuth.signInWithCredential(credential)).user;
          return user;
          break;
        case FacebookLoginStatus.cancelledByUser:
          throw _errorLoginSocial("CANCEL_BY_USER");
          break;
        case FacebookLoginStatus.error:
          throw _errorLoginSocial("UNKNOWN ERROR");
          break;
      }
    } catch(error) {
      print(error);
      throw _errorLoginSocial(error.code);
    }
  }

  Future register(
      String email,
      String password
  ) async {
    FirebaseUser user;
    try {
      user = (await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password)).user;

      await user.sendEmailVerification();

      await _fbAuth.signOut();
      return user;
    } catch (error) {
      throw _errorRegister(error.code);
    }
  }

  Future resetPassword(String email) async {
    try {
      await _fbAuth.sendPasswordResetEmail(email: email);
    } catch (error) {
      throw _errorResetPassword(error.code);
    }
  }

  String _errorLogin(String code) {
    var error = '';
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        error = 'The email address is malformed';
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
        error = "Can't login, please try again";
        break;
      default:
        error = "Can't login please try again";
    }

    return error;
  }

  String _errorLoginSocial(String code) {
    var error = '';
    switch (code) {
      case 'ERROR_INVALID_CREDENTIAL':
        error = 'The credential data is malformed or has expired.';
        break;
      case 'ERROR_USER_DISABLED':
        error = 'The user has been disabled';
        break;
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        error = 'There already exists an account with the email address asserted by Google';
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        error = 'Indicates that Google accounts are not enabled';
        break;
      case 'ERROR_INVALID_ACTION_CODE':
        error = 'The action code in the link is malformed, expired, or has already been used';
        break;
      default:
        error = "Can't login please try again";
    }

    return error;
  }

  String _errorRegister(String code) {
    var error = '';
    switch (code) {
      case 'ERROR_WEAK_PASSWORD':
        error = 'The password is not strong enough';
        break;
      case 'ERROR_INVALID_EMAIL':
        error = 'The email address is malformed';
        break;
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        error = 'The email is already in use by a different account';
        break;
      default:
        error = "Can't register, please try again";
    }

    return error;
  }

  String _errorResetPassword(String code) {
    var error = '';
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        error = 'The email address is malformed';
        break;
      case 'ERROR_USER_NOT_FOUND':
        error = 'The user not found';
        break;
      default:
        error = "Can't reset password, please try again";
    }

    return error;
  }
}
