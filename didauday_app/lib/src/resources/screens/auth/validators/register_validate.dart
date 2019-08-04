class RegisterValidate {
  static bool isValidEmail(String email) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'
    );

    return regExp.hasMatch(email);
  }
  static bool isValidPass(String password) {
    return password != null && password.length > 6;
  }

  static bool isValidConfirmPassword(String password, String confirmPassword) {
    return confirmPassword == password;
  }

  static bool isValidFirstName(String firstName) {
    return firstName != null && firstName.length > 0;
  }

  static bool isValidLastName(String firstName) {
    return firstName != null && firstName.length > 0;
  }

  static bool isValidBirthday(String birthday) {
    return birthday != null && birthday.length > 0;
  }

  static bool isValidAddress(String address) {
    return address != null && address.length > 0;
  }

  static bool isValidPhoneNumber(String phoneNumber) {

    RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');

    return phoneNumber != null && regExp.hasMatch(phoneNumber);
  }

}