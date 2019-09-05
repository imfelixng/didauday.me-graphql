import 'package:didauday_app/src/ui/views/tour/pages/tour_review/tour_add_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TourReviewList extends StatefulWidget {
  @override
  _TourReviewListState createState() => _TourReviewListState();
}

class _TourReviewListState extends State<TourReviewList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: FlatButton.icon(onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (BuildContext context) {
                    return TourAddReview();
                  },
                  fullscreenDialog: true
              ));
            }, icon: Icon(Icons.add, color: Colors.white,), label: Text('Write', style: TextStyle(color: Colors.white),)),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300], width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold
                      ),
                      children: <TextSpan>[
                        TextSpan(text: '3.2', style: TextStyle(fontSize: 30)),
                        TextSpan(text: '/5'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Very Good', style: TextStyle(fontSize: 16,),),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Based on ', style: TextStyle(fontSize: 16)),
                        TextSpan(text: '3 reviews', style: TextStyle(color: Colors.blue,)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Excellent', style: TextStyle(fontSize: 16,),),
                            Text('5', style: TextStyle(fontSize: 16,),)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: 0.3,
                          progressColor: Colors.green,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Very good', style: TextStyle(fontSize: 16,),),
                            Text('2', style: TextStyle(fontSize: 16,),)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: 0.2,
                          progressColor: Colors.greenAccent,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Average', style: TextStyle(fontSize: 16,),),
                            Text('0', style: TextStyle(fontSize: 16,),)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: 0,
                          progressColor: Colors.amber,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Poor', style: TextStyle(fontSize: 16,),),
                            Text('0', style: TextStyle(fontSize: 16,),)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: 0,
                          progressColor: Colors.orange,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Terrible', style: TextStyle(fontSize: 16,),),
                            Text('0', style: TextStyle(fontSize: 16,),)
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent: 0,
                          progressColor: Colors.red,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]),
                        )
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.account_circle, size: 48,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('An Nguyen Quang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                          RatingBar(
                                            initialRating: 4,
                                            itemSize: 20,
                                            itemBuilder:
                                                (context, _) =>
                                                Icon(
                                                  Icons.star,
                                                  color:
                                                  Colors.amber,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Good', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text('Best choise'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Container(
                          child: Text('22/09/2019', style: TextStyle(fontSize: 16),),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
