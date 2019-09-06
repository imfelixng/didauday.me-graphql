import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Old password',
                hintText: 'Enter old password',
                helperText: 'Password must be greater than 6 characters',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New password',
                hintText: 'Enter new password',
                helperText: 'Password must be greater than 6 characters',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                hintText: 'Enter confirm password',
                helperText: 'Password must be greater than 6 characters',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.lock,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
