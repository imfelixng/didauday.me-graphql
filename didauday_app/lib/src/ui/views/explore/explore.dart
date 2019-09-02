import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  bool tourTrend = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[100],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/flight');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            )
                          ]),
                      child: Icon(
                        Icons.flight,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Flights')
                  ],
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          )
                        ]),
                    child: Icon(
                      Icons.business,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Hotels')
                ],
              ),
              SizedBox(
                width: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/tour');
                },
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            )
                          ]),
                      child: Icon(
                        Icons.card_travel,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Tours')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Popular Destination',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 180,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 250,
                          margin: EdgeInsets.only(
                              right: index != 2 ? 20 : 0),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        ImageMock.img_city),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(5),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                width: 250,
                                height: 100,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin:
                                      Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.black
                                            .withOpacity(0.01),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'TP. Hồ Chí Minh',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Việt Nam',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.w400,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              '40 Tours',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                Colors.white,
                                              ),
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: () {},
                                            child: Text(
                                              '40 Hotels',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Treding',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              tourTrend = true;
                            });
                          },
                          color: tourTrend
                              ? Colors.green
                              : Colors.transparent,
                          child: Text(
                            'Tour',
                            style: TextStyle(
                              color: tourTrend
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              tourTrend = false;
                            });
                          },
                          color: !tourTrend
                              ? Colors.green
                              : Colors.transparent,
                          child: Text(
                            'Hotel',
                            style: TextStyle(
                              color: !tourTrend
                                  ? Colors.white
                                  : Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 330,
                  child: tourTrend
                      ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 250,
                        margin: EdgeInsets.only(
                            right: index != 2 ? 20 : 0),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          ImageMock
                                              .img_tour),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                    BorderRadius.only(
                                        topLeft: Radius
                                            .circular(
                                            5),
                                        topRight: Radius
                                            .circular(
                                            5)),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: EdgeInsets
                                        .symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                      BorderRadius.only(
                                          topRight: Radius
                                              .circular(
                                              5)),
                                    ),
                                    child: Text(
                                      '-20%',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.only(
                                    bottomLeft: Radius
                                        .circular(5),
                                    bottomRight:
                                    Radius.circular(
                                        5)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color: Colors
                                            .grey[300],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Đà Nẵng, Việt Nam',
                                        style: TextStyle(
                                          color: Colors
                                              .black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'American Parks Trail end Rapid City',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      RatingBar(
                                        initialRating: 4.5,
                                        itemSize: 20,
                                        allowHalfRating:
                                        true,
                                        itemBuilder:
                                            (context, _) =>
                                            Icon(
                                              Icons.star,
                                              color:
                                              Colors.amber,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('12 reviews')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons
                                                .access_time,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('6 days')
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .end,
                                        children: <Widget>[
                                          Text(
                                            '\$500',
                                            style:
                                            TextStyle(
                                              color: Colors
                                                  .red,
                                              decoration:
                                              TextDecoration
                                                  .lineThrough,
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                            ),
                                          ),
                                          Text(
                                            'From \$400',
                                            style:
                                            TextStyle(
                                              fontSize: 15,
                                              fontWeight:
                                              FontWeight
                                                  .bold,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                      : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 250,
                        margin: EdgeInsets.only(
                            right: index != 2 ? 20 : 0),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 180,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          ImageMock
                                              .img_hotel),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius:
                                    BorderRadius.only(
                                        topLeft: Radius
                                            .circular(
                                            5),
                                        topRight: Radius
                                            .circular(
                                            5)),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    padding: EdgeInsets
                                        .symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    decoration:
                                    BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                      BorderRadius.only(
                                          topRight: Radius
                                              .circular(
                                              5)),
                                    ),
                                    child: Text(
                                      '-20%',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: RatingBar(
                                    initialRating: 4.5,
                                    itemSize: 20,
                                    allowHalfRating: true,
                                    itemBuilder:
                                        (context, _) =>
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.only(
                                    bottomLeft: Radius
                                        .circular(5),
                                    bottomRight:
                                    Radius.circular(
                                        5)),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'American Parks Trail end Rapid City',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.location_on,
                                        size: 20,
                                        color: Colors
                                            .grey[300],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Đà Nẵng, Việt Nam',
                                        style: TextStyle(
                                          color: Colors
                                              .black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('4.6/5 Excellent',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('12 reviews')
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'From \$400 /night',
                                        style:
                                        TextStyle(
                                          fontSize: 15,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '\$500',
                                        style:
                                        TextStyle(
                                          color: Colors
                                              .red,
                                          decoration:
                                          TextDecoration
                                              .lineThrough,
                                          fontSize: 15,
                                          fontWeight:
                                          FontWeight
                                              .bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
