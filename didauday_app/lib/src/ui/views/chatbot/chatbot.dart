import 'package:didauday_app/src/core/models/flight.dart';
import 'package:didauday_app/src/core/models/hotel.dart';
import 'package:didauday_app/src/core/models/tour.dart';
import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:didauday_app/src/ui/helpers/random_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

abstract class ChatBotItem {}

class UserItem implements ChatBotItem {
  final String text;

  UserItem(this.text);
}

abstract class BotItem implements ChatBotItem {}

class BotTextItem implements BotItem {
  final String text;

  BotTextItem(this.text);
}

class BotListHotel implements BotItem {
  final List<Hotel> hotels;

  BotListHotel(this.hotels);
}

class BotListFlight implements BotItem {
  final List<Flight> flights;

  BotListFlight(this.flights);
}

class BotListTour implements BotItem {
  final List<Tour> tours;

  BotListTour(this.tours);
}

class ChatBot extends StatefulWidget {
  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<ChatBotItem> chatItems;

  @override
  void initState() {
    super.initState();

    chatItems = <ChatBotItem>[
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem('hbhabdhbhdbhadBA...'),
      UserItem('Hello'),
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      UserItem('Hello'),
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem('Hello hbhabdhbhdbhadBA...'),
      UserItem('Hello'),
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem('Hello hbhabdhbhdbhadBA...'),
      UserItem('Hello'),
      BotListTour(
        [
          Tour(
            description: null,
            images: <String>[ImageMock.img_tour],
            name: null,
            price: null,
          ),
          Tour(
            description: null,
            images: <String>[ImageMock.img_tour],
            name: null,
            price: null,
          ),
          Tour(
            description: null,
            images: <String>[ImageMock.img_tour],
            name: null,
            price: null,
          )
        ],
      ),
      BotListHotel(
        [Hotel(), Hotel()],
      ),
      BotListFlight([
        Flight(),
        Flight(),
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 1000,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: chatItems.length,
              itemBuilder: (context, index) {
                final item = chatItems[index];

                if (item is UserItem) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 8, top: 8),
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(
                          maxWidth: 300,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfffd5739),
                          borderRadius: RandomBorder.randomBorderRadius(true),
                        ),
                        child: Text(
                          item.text,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  );
                }

                if (item is BotTextItem) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 8, top: 8),
                        padding: const EdgeInsets.all(8),
                        constraints: BoxConstraints(
                          maxWidth: 300,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xfff5f5f5),
                          borderRadius: RandomBorder.randomBorderRadius(false),
                        ),
                        child: Text(
                          item.text,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      )
                    ],
                  );
                }

                if (item is BotListTour) {
                  if (item.tours.length == 0) {
                    return Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sorry! We have not recommendation for you.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 8),
                            padding: const EdgeInsets.all(8),
                            constraints: BoxConstraints(
                              maxWidth: 300,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius:
                                  RandomBorder.randomBorderRadius(false),
                            ),
                            child: Text(
                              'Here are some offers:',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 120,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: item.tours.length,
                          itemBuilder: (context, index) {
                            var tour = item.tours[index];
                            return Container(
                              width: 320,
                              margin: EdgeInsets.only(
                                right: item.tours.length - 1 != index ? 20 : 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(tour.images[0]),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'New York: Museum of Modern Art',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.grey[400],
                                              size: 20,
                                            ),
                                            Text('Da Nang, Viet Nam')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        RatingBar(
                                          initialRating: 3.5,
                                          itemSize: 20,
                                          allowHalfRating: true,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              size: 20,
                                            ),
                                            Text('50')
                                          ],
                                        ),
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
                  );
                }

                if (item is BotListHotel) {
                  if (item.hotels.length == 0) {
                    return Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sorry! We have not recommendation for you.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 8),
                            padding: const EdgeInsets.all(8),
                            constraints: BoxConstraints(
                              maxWidth: 300,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius:
                                  RandomBorder.randomBorderRadius(false),
                            ),
                            child: Text(
                              'Here are some offers:',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 120,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: item.hotels.length,
                          itemBuilder: (context, index) {
                            var hotel = item.hotels[index];
                            return Container(
                              width: 320,
                              margin: EdgeInsets.only(
                                right: item.hotels.length - 1 != index ? 20 : 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(ImageMock.img_hotel),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Edwardian Kenilworth',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.grey[400],
                                              size: 20,
                                            ),
                                            Text('Boston, MA, USA')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        RatingBar(
                                          initialRating: 4.5,
                                          itemSize: 20,
                                          allowHalfRating: true,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              size: 20,
                                            ),
                                            Text('500')
                                          ],
                                        ),
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
                  );
                }

                if (item is BotListFlight) {
                  if (item.flights.length == 0) {
                    return Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sorry! We have not recommendation for you.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 8),
                            padding: const EdgeInsets.all(8),
                            constraints: BoxConstraints(
                              maxWidth: 300,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xfff5f5f5),
                              borderRadius:
                                  RandomBorder.randomBorderRadius(false),
                            ),
                            child: Text(
                              'Here are some offers:',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 120,
                        margin: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: item.flights.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 320,
                              margin: EdgeInsets.only(
                                right:
                                    item.flights.length - 1 != index ? 20 : 0,
                              ),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            Text('Duraction: 17h15m')
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          height: 20,
                                          alignment: Alignment.centerLeft,
                                          child:
                                              Image.network(ImageMock.logo_vn),
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
                      ),
                    ],
                  );
                }

                return Container(width: 0, height: 0);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5,),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: new Offset(0, -2),
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.menu,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        hintText: 'Input chat message...',
                    ),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  child: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
