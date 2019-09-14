import 'package:didauday_app/src/ui/views/cart/cart.dart';
import 'package:didauday_app/src/ui/views/cart/pages/check_out/check_out.dart';
import 'package:didauday_app/src/ui/views/flight/flight.dart';
import 'package:didauday_app/src/ui/views/flight/pages/flight_detail/flight_detail.dart';
import 'package:didauday_app/src/ui/views/flight/pages/flight_filter/flight_filter.dart';
import 'package:didauday_app/src/ui/views/flight/pages/flight_search/flight_search.dart';
import 'package:didauday_app/src/ui/views/home/home.dart';
import 'package:didauday_app/src/ui/views/tour/pages/tour_detail/tour_detail.dart';
import 'package:didauday_app/src/ui/views/tour/pages/tour_filter/tour_filter.dart';
import 'package:didauday_app/src/ui/views/tour/pages/tour_review/tour_review.dart';
import 'package:didauday_app/src/ui/views/tour/pages/tour_search/tour_search.dart';
import 'package:didauday_app/src/ui/views/tour/tour.dart';
import 'package:didauday_app/src/ui/views/user/pages/change_password.dart';
import 'package:didauday_app/src/ui/views/user/pages/my_booking.dart';
import 'package:didauday_app/src/ui/views/user/pages/personal_info.dart';
import 'package:didauday_app/src/ui/widgets/check_network/check_network.dart';
import 'package:flutter/material.dart';
import 'package:didauday_app/src/ui/views/auth/auth.dart';
import 'package:didauday_app/src/ui/views/auth/pages/forgot_password_page/forgot_password.dart';
import 'package:didauday_app/src/ui/views/auth/pages/login_page/login.dart';
import 'package:didauday_app/src/ui/views/auth/pages/register_page/register.dart';
import 'package:didauday_app/src/ui/views/user/pages/update_profile.dart';
import 'package:flutter/cupertino.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/auth':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: Auth()));
        }
      case '/auth/login':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: Login()));
        }
      case '/auth/register':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: Register()));
        }
      case '/auth/forgot_password':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: ForgotPassword()));
        }
      case '/home':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: Home(),));
        }
      case '/user/personal_info':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: PersonalInfo()));
        }
      case '/user/update_profile':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: UpdateProfile()));
        }
      case '/user/my_booking':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: MyBooking()));
        }
      case '/user/change_password':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: ChangePassword()));
        }
      case '/flight':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: FlightPage()));
        }
      case '/flight/search':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: FlightSearch()));
        }
      case '/flight/search/filter':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: FlightFilter()));
        }
      case '/flight/detail':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: FlightDetail()));
        }
      case '/tour':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: TourPage()));
        }
      case '/tour/search':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: TourSearch()));
        }
      case '/tour/search/filter':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: TourFilter()));
        }
      case '/tour/detail':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: TourDetail()));
        }
      case '/tour/detail/reviews':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: TourReviewList()));
        }
      case '/cart':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: Cart()));
        }
      case '/check_out':
        {
          return CupertinoPageRoute(
              builder: (context) => CheckNetwork(child: Checkout()));
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
