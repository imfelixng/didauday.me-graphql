import 'package:didauday_app/src/ui/views/auth/auth.dart';
import 'package:didauday_app/src/ui/views/auth/pages/forgot_password_page/forgot_password.dart';
import 'package:didauday_app/src/ui/views/auth/pages/login_page/login.dart';
import 'package:didauday_app/src/ui/views/auth/pages/register_page/register.dart';
import 'package:didauday_app/src/ui/views/home/home.dart';
import 'package:didauday_app/src/ui/views/user/pages/update_profile/update_profile.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/auth': {
      return CupertinoPageRoute(builder: (context) => Auth());
    }
    case '/auth/login': {
      return CupertinoPageRoute(builder: (context) => Login());
    }
    case '/auth/register': {
      return CupertinoPageRoute(builder: (context) => Register());
    }
    case '/auth/forgot_password': {
      return CupertinoPageRoute(builder: (context) => ForgotPassword());
    }
    case '/home': {
      return CupertinoPageRoute(builder: (context) => Home());
    }
    case '/user/update_profile': {
      return CupertinoPageRoute(builder: (context) => UpdateProfile());
    }
  }
  return null;
}