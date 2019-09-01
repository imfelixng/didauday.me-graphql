import 'package:flutter/material.dart';

class FlightSearch extends StatefulWidget {
  @override
  _FlightSearchState createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Results'),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/flight/search/filter');
              },
              child: Icon(
                Icons.filter_list,
              ),
            ),
            SizedBox(width: 10,),
          ],
        ),
      ),
    );
  }
}
