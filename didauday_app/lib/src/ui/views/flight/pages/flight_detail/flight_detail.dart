import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:flutter/cupertino.dart';
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
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: 120,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.deepOrange,
                child: Text('Book now', style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(ImageMock.logo_vn),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'DND - SGN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '\$ 260',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Mon, Mar 11, 2019 | 1 Pass - Economy',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              Container(
                height: 210,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Flight to', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,),),
                        Row(
                          children: <Widget>[
                            Icon(Icons.access_time),
                            Text('17h 15m', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('8:00 am', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                        SizedBox(width: 10,),
                                        Text('Mon, Sep 02, 2019', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black38),),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(text: 'DAD  ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                                              TextSpan(text: 'Đà Nẵng, Việt Nam', style: TextStyle(fontWeight: FontWeight.w400,  color: Colors.black38, fontSize: 15)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: index != 1 ? 50 : 0,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
