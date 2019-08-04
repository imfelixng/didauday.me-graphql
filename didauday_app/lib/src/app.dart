import 'package:flutter/material.dart';
import 'resources/screens/auth/auth.dart';
import 'resources/screens/auth/pages/forgot_password_page/forgot_password.dart';
import 'resources/screens/auth/pages/login_page/login.dart';
import 'resources/screens/auth/pages/register_page/register.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Auth(),
      routes: {
        '/auth/login': (context) => Login(),
        '/auth/register': (context) => Register(),
        '/auth/forgot_password': (context) => ForgotPassword(),
      },
    );
  }
}
