import 'dart:math';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:didauday_app/src/core/models/flight.dart';
import 'package:didauday_app/src/core/models/hotel.dart';
import 'package:didauday_app/src/core/models/tour.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var _showChatBox = false;

  Animation<double> _chatBoxAnim;
  AnimationController _chatBoxController;

  @override
  void initState() {
    super.initState();

    _chatBoxController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _chatBoxAnim = _chatBoxController;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final bottomMargin = kBottomNavigationBarHeight + 20;

    return Scaffold(
      appBar: AppBar(
        title: Text('Di Dau Day'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            IgnorePointer(
              ignoring: _showChatBox,
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Title'),
                    subtitle: Text('Subtile'),
                  );
                },
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
      bottomNavigationBar: IgnorePointer(
        ignoring: _showChatBox,
        child: BottomNavyBar(
          selectedIndex: 0,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (i) {},
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Saved'),
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
      BotTextItem('Fucking...'),
      BotListHotel([]),
      BotListFlight([]),
      UserItem('Hello'),
      BotListTour(
        [
          Tour(
            description: null,
            images: <String>[],
            name: null,
            price: null,
          )
        ],
      ),
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem('Fucking...'),
      BotListHotel([]),
      BotListFlight([]),
      UserItem('Hello'),
      BotListTour(
        [
          Tour(
            description: null,
            images: <String>[],
            name: null,
            price: null,
          )
        ],
      ),
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem('Fucking...'),
      BotListHotel([]),
      BotListFlight([]),
      UserItem('Hello'),
      BotListTour(
        [
          Tour(
            description: null,
            images: <String>[],
            name: null,
            price: null,
          )
        ],
      ),
      UserItem('Hello'),
      UserItem('Hello hbhabdhbhdbhadBA'),
      UserItem(
          'Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 Hello 12345678 '),
      BotTextItem('Fucking...'),
      BotListHotel([]),
      BotListFlight([]),
      UserItem('Hello'),
      BotListTour(
        [
          Tour(
            description: null,
            images: <String>[],
            name: null,
            price: null,
          )
        ],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
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
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: chatItems.length,
        itemBuilder: (context, index) {
          final item = chatItems[index];

          if (item is UserItem) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, top: 8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xfffd5739),
                      borderRadius: _randomBorderRadius(true),
                    ),
                    child: Text(
                      item.text,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            );
          }

          if (item is BotTextItem) {
            return Container(
              margin: EdgeInsets.only(
                left: 8,
                top: 8,
                right: MediaQuery.of(context).size.width * 0.3,
              ),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xffcdcdcd),
                borderRadius: _randomBorderRadius(false),
              ),
              child: Text(
                item.text,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 16),
              ),
            );
          }

          return Container(width: 0, height: 0);
        },
      ),
    );
  }
}

BorderRadius _randomBorderRadius(bool right) {
  final index = Random().nextInt(4);
  // 4 -> 10
  if (index == 0) {
    return BorderRadius.only(
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
      bottomRight: Radius.circular(10),
    );
  }
  // 2 -> 10, 2 -> 0
  if (index == 1) {
    if (!right) {
      return BorderRadius.only(
        topLeft: Radius.circular(2),
        bottomLeft: Radius.circular(2),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(2),
        topRight: Radius.circular(2),
      );
    }
  }
  // top 10
  if (index == 2) {
    if (right) {
      return BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(2),
      );
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(2),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    }
  }
  if (index == 3) {
    if (right) {
      return BorderRadius.only(
        topLeft: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(2),
        topRight: Radius.circular(10),
      );
    } else {
      return BorderRadius.only(
        topLeft: Radius.circular(2),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
        topRight: Radius.circular(10),
      );
    }
  }
  return null;
}
