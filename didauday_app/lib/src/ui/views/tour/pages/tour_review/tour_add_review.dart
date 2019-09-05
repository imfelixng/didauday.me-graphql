import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TourAddReview extends StatefulWidget {
  @override
  _TourAddReviewState createState() => _TourAddReviewState();
}

class _TourAddReviewState extends State<TourAddReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write new review'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                label: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  hintText: 'Enter title for your review'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Content',
                hintText: 'Enter content for your review',
              ),
              maxLines: 6,
                textAlignVertical: TextAlignVertical.top,
              minLines: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Rating',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: RatingBar(
                initialRating: 3,
                itemCount: 5,
                itemPadding: EdgeInsets.only(right: 10),
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                      );
                    case 1:
                      return Icon(
                        Icons.sentiment_dissatisfied,
                        color: Colors.redAccent,
                      );
                    case 2:
                      return Icon(
                        Icons.sentiment_neutral,
                        color: Colors.amber,
                      );
                    case 3:
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.lightGreen,
                      );
                    case 4:
                      return Icon(
                        Icons.sentiment_very_satisfied,
                        color: Colors.green,
                      );
                    default:
                      return Container();
                  }
                },
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
