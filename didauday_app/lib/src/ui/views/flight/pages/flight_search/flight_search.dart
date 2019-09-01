import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              Container(
                height: 80,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    String date = DateFormat('EEE-dd-MMM-yyyy').format(DateTime.now().add(Duration(days: index)));
                    String monthName = date.split('-')[2];
                    String day = date.split('-')[1];
                    String dayName = date.split('-')[0];
                    return Container(
                      width: 60,
                      margin: EdgeInsets.only(right: index != 9 ? 20 : 0),
                      decoration: BoxDecoration(
                        color: index == 0 ? Colors.deepOrange : Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('$dayName', style: TextStyle(color: Colors.white, fontSize: 16,),),
                          Text('$day $monthName', style: TextStyle(color: Colors.white, fontSize: 16,),),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Found 20 tickets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 320,
                      margin: EdgeInsets.only(
                        bottom:
                       19 != index ? 10 : 0,
                      ),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '8:00 am',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'DND',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black38),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.flight_takeoff,
                                          ),
                                          Text('----------')
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '2:00 pm',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'SGN',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Colors.black38),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.grey[400],
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Duration : ',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: '17h 15m', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
                                          TextSpan(text: ' | ', style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: 'Non-stop',),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height: 20,
                                  alignment: Alignment.centerLeft,
                                  child:
                                  Image.network(index != 1 ? ImageMock.logo_vn : ImageMock.logo_vj),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '\$ 253',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                            ),
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
      ),
    );
  }
}
