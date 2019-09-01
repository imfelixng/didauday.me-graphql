import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:didauday_app/src/ui/views/chatbot/chatbot.dart';
import 'package:didauday_app/src/ui/widgets/drawer/drawer_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  var _showChatBox = false;

  Animation<double> _chatBoxAnim;
  AnimationController _chatBoxController;
  bool tourTrend = true;

  @override
  void initState() {
    super.initState();

    _chatBoxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _chatBoxAnim = _chatBoxController;

    FirebaseAuth.instance.currentUser().then((firebaseUser) {
      if (firebaseUser == null) {
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
      }
    }).catchError((error) {
      Navigator.pushNamedAndRemoveUntil(context, '/auth', (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bottomMargin = kBottomNavigationBarHeight + 20;

    return Scaffold(
      appBar: AppBar(
        title: Text('Đi Đâu Đây'),
        actions: <Widget>[
          Icon(Icons.shopping_cart),
          SizedBox(width: 10,),
        ],
      ),
      drawer: DrawerApp(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                IgnorePointer(
                  ignoring: _showChatBox,
                  child: Container(
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
                            Column(
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
                                Text('Tour')
                              ],
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
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: bottomMargin,
                  child: Container(
                    child: CircularRevealAnimation(
                      child: ChatBot(),
                      animation: _chatBoxAnim,
                      minRadius: 0,
                      maxRadius: 1000,
                      center: Offset(
                        width - 16,
                        height - bottomMargin,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: IgnorePointer(
        ignoring: _showChatBox,
        child: BottomNavyBar(
          selectedIndex: 0,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (i) {},
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favourite'),
              activeColor: Colors.purpleAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
              activeColor: Colors.pink,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickChatFab,
        child: _showChatBox
            ? Icon(Icons.close)
            : Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Icon(
                        FontAwesomeIcons.robot,
                        color: Colors.white,
                      ),
                      alignment: AlignmentDirectional(
                        -0.2,
                        -0.2,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void _clickChatFab() {
    _showChatBox = !_showChatBox;
    setState(() {});
    if (_showChatBox) {
      _chatBoxController.forward();
    } else {
      _chatBoxController.reverse();
    }
  }
}
