import 'dart:async';

import 'package:didauday_app/src/resources/screens/auth/validators/register_validate.dart';


class RegisterBloc {
  StreamController _emailController = new StreamController();
  StreamController _passwordController = new StreamController();
  StreamController _confirmPasswordController = new StreamController();

  StreamController _firstNameController = new StreamController();
  StreamController _lastNameController = new StreamController();
  StreamController _birthdayController = new StreamController();
  StreamController _genderController = new StreamController();
  StreamController _addressController = new StreamController();
  StreamController _phoneNumberController = new StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;
  Stream get confirmPasswordStream => _confirmPasswordController.stream;

  Stream get firstNameStream => _firstNameController.stream;
  Stream get lastNameStream => _lastNameController.stream;
  Stream get birthdayStream => _birthdayController.stream;
  Stream get genderStream => _genderController.stream;
  Stream get addressStream => _addressController.stream;
  Stream get phoneNumberStream => _phoneNumberController.stream;



  bool isValidDataRegister(
      String email, String password, String confirmPassword,
      String firstName, String lastName, DateTime birthday, String gender, String address, String phoneNumber,
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

    if (!RegisterValidate.isValidFirstName(firstName)) {
      _firstNameController.sink.addError("First name is invalid");
      return false;
    }
    _firstNameController.sink.add("");

    if (!RegisterValidate.isValidLastName(lastName)) {
      _lastNameController.sink.addError("Last name is invalid");
      return false;
    }
    _lastNameController.sink.add("");

    if (!RegisterValidate.isValidBirthday(birthday)) {
      _birthdayController.sink.addError("Birthday is invalid");
      return false;
    }
    _birthdayController.sink.add("");

    if (!RegisterValidate.isValidAddress(address)) {
      _addressController.sink.addError("Address is invalid");
      return false;
    }
    _addressController.sink.add("");

    if (!RegisterValidate.isValidPhoneNumber(phoneNumber)) {
      _phoneNumberController.sink.addError("Phone number is invalid");
      return false;
    }
    _phoneNumberController.sink.add("");

    return true;

  }


  void dispose() {
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();

    _firstNameController.close();
    _lastNameController.close();
    _birthdayController.close();
    _genderController.close();
    _addressController.close();
    _phoneNumberController.close();
  }

}
