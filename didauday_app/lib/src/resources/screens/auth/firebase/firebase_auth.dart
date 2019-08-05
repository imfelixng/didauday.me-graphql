import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FBAuth {
  FirebaseAuth _fbAuth = FirebaseAuth.instance;
  Firestore _fs = Firestore.instance;

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
    var token = await user.getIdToken();
    print(token);
    return user;
  }

  Future loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future register(
      String email,
      String password,
      String firstName,
      String lastName,
      int birthday,
      String gender,
      String address,
      String phoneNumber) async {
    var result;
    try {
      result = await _fbAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await createUser(result.user.uid, email, firstName, lastName, birthday, gender,
          address, phoneNumber);
      return result.user;

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

  Future createUser(String userId, String email, String firstName, String lastName,
      int birthday, String gender, String address, String phoneNumber) async {
    try {
      await _fs.collection('users').document(userId).setData({
        'userId': userId,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'birthday': birthday,
        'gender': gender,
        'address': address,
        'phoneNumber': phoneNumber,
        'isComplete': true,
      });
    } catch(error) {
      print("============================================");
      print(error);
      throw error;
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
