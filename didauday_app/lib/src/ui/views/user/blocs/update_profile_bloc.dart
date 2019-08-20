import 'dart:async';

import 'package:didauday_app/src/ui/views/user/validators/update_profile_validate.dart';


class UpdateProfileBloc {
  StreamController _firstNameController = new StreamController();
  StreamController _lastNameController = new StreamController();
  StreamController _birthdayController = new StreamController();
  StreamController _genderController = new StreamController();
  StreamController _addressController = new StreamController();
  StreamController _phoneNumberController = new StreamController();

  Stream get firstNameStream => _firstNameController.stream;
  Stream get lastNameStream => _lastNameController.stream;
  Stream get birthdayStream => _birthdayController.stream;
  Stream get genderStream => _genderController.stream;
  Stream get addressStream => _addressController.stream;
  Stream get phoneNumberStream => _phoneNumberController.stream;



  bool isValidDataUpdate(
      String firstName, String lastName, DateTime birthday, String gender, String address, String phoneNumber,
      ) {

    if (!UpdateProfileValidate.isValidFirstName(firstName)) {
      _firstNameController.sink.addError("First name is invalid");
      return false;
    }
    _firstNameController.sink.add("");

    if (!UpdateProfileValidate.isValidLastName(lastName)) {
      _lastNameController.sink.addError("Last name is invalid");
      return false;
    }
    _lastNameController.sink.add("");

    if (!UpdateProfileValidate.isValidBirthday(birthday)) {
      _birthdayController.sink.addError("Birthday is invalid");
      return false;
    }
    _birthdayController.sink.add("");

    if (!UpdateProfileValidate.isValidAddress(address)) {
      _addressController.sink.addError("Address is invalid");
      return false;
    }
    _addressController.sink.add("");

    if (!UpdateProfileValidate.isValidPhoneNumber(phoneNumber)) {
      _phoneNumberController.sink.addError("Phone number is invalid");
      return false;
    }
    _phoneNumberController.sink.add("");

    return true;

  }

  void dispose() {
    _firstNameController.close();
    _lastNameController.close();
    _birthdayController.close();
    _genderController.close();
    _addressController.close();
    _phoneNumberController.close();
  }

}
