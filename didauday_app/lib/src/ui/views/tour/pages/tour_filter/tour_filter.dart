import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TourFilter extends StatefulWidget {
  @override
  _TourFilterState createState() => _TourFilterState();
}

class _TourFilterState extends State<TourFilter> {
  RangeValues priceValues = RangeValues(0, 10000);

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
              onPressed: () {},
              child: Text(
                'Apply',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Choose date',
                labelText: 'Date',
                prefixIcon: Icon(
                  Icons.date_range,
                ),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                  context: context,
                  initialFirstDate: new DateTime.now().add(Duration(days: 1)),
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
              height: 20,
            ),
            Text(
              'Filter Price',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            RangeSlider(
              min: 0,
              max: 10000,
              values: priceValues,
              onChangeStart: (values) {
                setState(() {
                  priceValues = values;
                });
              },
              onChanged: (values) {
                setState(() {
                  priceValues = values;
                });
              },
              activeColor: Colors.blue,
              inactiveColor: Colors.grey[300],
              divisions: 100,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      "${priceValues.start.toInt()}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      "${priceValues.end.toInt()}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Review Score',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                    ),
                    RatingBar(
                      initialRating: 5,
                      itemCount: 5,
                      itemSize: 24,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: true,
                    ),
                    RatingBar(
                      initialRating: 4,
                      itemCount: 5,
                      itemSize: 24,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                    ),
                    RatingBar(
                      initialRating: 3,
                      itemCount: 5,
                      itemSize: 24,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                    ),
                    RatingBar(
                      initialRating: 2,
                      itemCount: 5,
                      itemSize: 24,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: false,
                    ),
                    RatingBar(
                      initialRating: 1,
                      itemCount: 5,
                      itemSize: 24,
                      tapOnlyMode: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
