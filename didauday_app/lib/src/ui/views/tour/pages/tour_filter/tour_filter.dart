import 'package:flutter/material.dart';

class TourFilter extends StatefulWidget {
  @override
  _TourFilterState createState() => _TourFilterState();
}

class _TourFilterState extends State<TourFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Filter'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              color: Colors.green,
              onPressed: () {

              },
              child: Text('Apply',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
