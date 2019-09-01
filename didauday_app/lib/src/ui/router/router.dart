import 'package:didauday_app/src/ui/views/flight/flight.dart';
import 'package:didauday_app/src/ui/views/flight/pages/flight_filter/flight_filter.dart';
import 'package:didauday_app/src/ui/views/flight/pages/flight_search/flight_search.dart';
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
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: Auth()));
        }
      case '/auth/login':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: Login()));
        }
      case '/auth/register':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: Register()));
        }
      case '/auth/forgot_password':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: ForgotPassword()));
        }
      case '/home':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: Home()));
        }
      case '/user/update_profile':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: UpdateProfile()));
        }
      case '/flight':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: FlightPage()));
        }
      case '/flight/search':
        {
          return CupertinoPageRoute(builder: (context) => CheckNetwork(child: FlightSearch()));
        }
      case '/flight/search/filter':
      {
        return CupertinoPageRoute(builder: (context) => CheckNetwork(child: FlightFilter()));
      }
      default:
        return CupertinoPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
