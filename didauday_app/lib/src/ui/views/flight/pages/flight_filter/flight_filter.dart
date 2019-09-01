import 'package:flutter/material.dart';

class FlightFilter extends StatefulWidget {
  @override
  _FlightFilterState createState() => _FlightFilterState();
}

class _FlightFilterState extends State<FlightFilter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Filter'),
          leading: GestureDetector( onTap: () { Navigator.pop(context); },child: Icon(Icons.close, color: Colors.white,)),
        ),
      ),
    );
  }
}
