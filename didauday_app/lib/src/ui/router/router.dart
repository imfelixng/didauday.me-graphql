import 'package:didauday_app/src/ui/views/home/home.dart';
import 'package:didauday_app/src/ui/widgets/check_network/check_network.dart';
import 'package:flutter/material.dart';
import 'package:didauday_app/src/ui/views/auth/auth.dart';
import 'package:didauday_app/src/ui/views/auth/pages/forgot_password_page/forgot_password.dart';
import 'package:didauday_app/src/ui/views/auth/pages/login_page/login.dart';
import 'package:didauday_app/src/ui/views/auth/pages/register_page/register.dart';
import 'package:didauday_app/src/ui/views/user/pages/update_profile/update_profile.dart';
import 'package:flutter/cupertino.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/auth':
        {
          return MaterialPageRoute(builder: (context) => CheckNetwork(child: Auth()));
        }
      case '/auth/login':
        {
          return MaterialPageRoute(builder: (context) => CheckNetwork(child: Login()));
        }
      case '/auth/register':
        {
          return MaterialPageRoute(builder: (context) => CheckNetwork(child: Register()));
        }
      case '/auth/forgot_password':
        {
          return MaterialPageRoute(builder: (context) => CheckNetwork(child: ForgotPassword()));
        }
      case '/home':
        {
          return MaterialPageRoute(builder: (context) => CheckNetwork(child: Home()));
        }
      case '/user/update_profile':
        {
          return MaterialPageRoute(builder: (context) => CheckNetwork(child: UpdateProfile()));
        }
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
