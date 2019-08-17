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
      home: Home(),
      routes: {
        '/auth/login': (context) => Login(),
        '/auth/register': (context) => Register(),
        '/auth/forgot_password': (context) => ForgotPassword(),
        '/home': (context) => Home(),
        '/user/update_profile': (context) => UpdateProfile(),
      },
    );
  }
}
