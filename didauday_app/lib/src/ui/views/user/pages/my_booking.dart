import 'package:flutter/material.dart';

class MyBooking extends StatefulWidget {
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Booking'),
      ),
    );
  }
}
