import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class FlightFilter extends StatefulWidget {
  @override
  _FlightFilterState createState() => _FlightFilterState();
}

class _FlightFilterState extends State<FlightFilter> {
  @override
  Widget build(BuildContext context) {
    bool isOneWay = true;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Filter'),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.white,
              )),
          actions: <Widget>[
            Container(
              width: 100,
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter from city',
                    labelText: 'From',
                    prefixIcon: Icon(
                      Icons.flight_takeoff,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Enter to city',
                    labelText: 'To',
                    prefixIcon: Icon(
                      Icons.flight_land,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              isOneWay
                  ? TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Choose deparute day',
                          labelText: 'Deparute on',
                          prefixIcon: Icon(
                            Icons.date_range,
                          )),
                      onTap: () async {
                        DateTime picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now().add(Duration(days: 1)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null)
                          setState(() {
                            print(picked);
                          });
                      },
                    )
                  : TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Choose date',
                          labelText: 'Date',
                          prefixIcon: Icon(
                            Icons.date_range,
                          )),
                      onTap: () async {
                        final List<DateTime> picked =
                            await DateRagePicker.showDatePicker(
                          context: context,
                          initialFirstDate:
                              new DateTime.now().add(Duration(days: 1)),
                          initialLastDate:
                              (new DateTime.now()).add(new Duration(days: 7)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        );
                        if (picked != null && picked.length == 2) {
                          print(picked);
                        }
                      },
                    ),
              SizedBox(
                height: 10,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'Choose seat type',
                    labelText: 'Seat type',
                    prefixIcon: Icon(
                      Icons.airline_seat_recline_normal,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                    hintText: 'Choose passenger number',
                    labelText: 'Passenger number',
                    prefixIcon: Icon(
                      Icons.people,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
