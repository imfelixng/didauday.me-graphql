import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class FlightPage extends StatefulWidget {
  @override
  _FlightPageState createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Flights'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: CupertinoSegmentedControl<int>(
                  children: {
                    0: Container(
                      height: 30,
                      child: Center(child: Text('One Way', style: TextStyle(
                        fontSize: 16,
                      ),),),
                    ),
                    1: Container(
                height: 30,
                child: Center(child: Text('Road Trip', style: TextStyle(
                fontSize: 16,
                ),),),
                ),
                  },
                  onValueChanged: (int newValue) {
                    setState(() {
                      currentValue = newValue;
                    });
                  },
                  groupValue: currentValue,
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter from city',
                        labelText: 'From',
                        prefixIcon: Icon(
                          Icons.flight_takeoff,
                        ),
                      border: OutlineInputBorder(),
                    ),
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
                        ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  currentValue == 0
                      ? TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: 'Choose deparute day',
                              labelText: 'Deparute on',
                              prefixIcon: Icon(
                                Icons.date_range,
                              ),
                            border: OutlineInputBorder(),),
                          onTap: () async {
                            DateTime picked = await showDatePicker(
                              context: context,
                              initialDate:
                                  DateTime.now().add(Duration(days: 1)),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)),
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
                              ),border: OutlineInputBorder(),),
                          onTap: () async {
                            final List<DateTime> picked =
                                await DateRagePicker.showDatePicker(
                              context: context,
                              initialFirstDate:
                                  new DateTime.now().add(Duration(days: 1)),
                              initialLastDate: (new DateTime.now())
                                  .add(new Duration(days: 7)),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(Duration(days: 365)),
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
                        ),border: OutlineInputBorder(),),
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
                        ),border: OutlineInputBorder(),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        onPressed: () {
                          Navigator.pushNamed(context, '/flight/search');
                        },
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
