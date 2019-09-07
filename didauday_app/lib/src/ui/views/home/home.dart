import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:didauday_app/src/ui/views/chatbot/chatbot.dart';
import 'package:didauday_app/src/ui/views/explore/explore.dart';
import 'package:didauday_app/src/ui/views/favourite/favourite.dart';
import 'package:didauday_app/src/ui/views/notification/notification.dart';
import 'package:didauday_app/src/ui/views/user/profile.dart';
import 'package:didauday_app/src/ui/widgets/drawer/drawer_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool tourTrend = true;
  int selectBottomTab = 0;

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
    List<Widget> widgets = [
      Explore(),
      Favourite(),
      NotificationPage(),
      Profile(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Đi Đâu Đây'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },),
        ],
      ),
      drawer: DrawerApp(),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            IgnorePointer(
              ignoring: _showChatBox,
              child: widgets[selectBottomTab],
            ),
            Positioned(
              left: 15,
              right: 15,
              top: 15,
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
          selectedIndex: selectBottomTab,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (i) {
            setState(() {
              selectBottomTab = i;
            });
          },
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
