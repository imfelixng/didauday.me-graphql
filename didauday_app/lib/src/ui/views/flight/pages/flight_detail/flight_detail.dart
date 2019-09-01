import 'package:flutter/material.dart';

class FlightDetail extends StatefulWidget {
  @override
  _FlightDetailState createState() => _FlightDetailState();
}

class _FlightDetailState extends State<FlightDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flight Detail'),
        ),
        body: Container(

        ),
      ),
    );
  }
}
