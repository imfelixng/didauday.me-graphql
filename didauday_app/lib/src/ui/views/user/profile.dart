import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          ImageMock.img_avatar
                        )
                      )
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Misa Nguyen',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/user/personal_info');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey[300]),
                          )),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.addressCard, size: 30,),
                        title: Text('Personal Info'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/user/my_booking');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey[300]),
                          )),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.calendarCheck, size: 30,),
                        title: Text('My Booking'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey[300]),
                          )),
                      child: ListTile(
                        leading: Icon(Icons.credit_card, size: 30,),
                        title: Text('My Cards'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/user/change_password');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.grey[300]),
                            bottom: BorderSide(color: Colors.grey[300]),
                          )),
                      child: ListTile(
                        leading: Icon(Icons.lock, size: 30,),
                        title: Text('Password'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
