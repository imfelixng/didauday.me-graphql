import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'resources/screens/auth/auth.dart';
import 'resources/screens/auth/pages/forgot_password_page/forgot_password.dart';
import 'resources/screens/auth/pages/login_page/login.dart';
import 'resources/screens/auth/pages/register_page/register.dart';
import 'resources/screens/home/home.dart';
import 'resources/screens/user/pages/update_profile/update_profile.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Auth(),
      onGenerateRoute: (settings) {
        var name = settings.name;
        if (name == '/auth/login') {
          return CupertinoPageRoute(builder: (context) => Login());
        }
        if (name == '/auth/register') {
          return CupertinoPageRoute(builder: (context) => Register());
        }
        if (name == '/auth/forgot_password') {
          return CupertinoPageRoute(builder: (context) => ForgotPassword());
        }
        if (name == '/home') {
          return CupertinoPageRoute(builder: (context) => Home());
        }

        if (name == '/user/update_profile') {
          return CupertinoPageRoute(builder: (context) => UpdateProfile());
        }
        return null;
      },
    );
  }
}
