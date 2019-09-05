import 'package:flutter/material.dart';

class DialogInfo extends StatefulWidget {
  @override
  _DialogInfoState createState() => _DialogInfoState();
}

class _DialogInfoState extends State<DialogInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text('Passenger Information'),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {},
              color: Colors.deepOrange,
              child: new Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Họ (ex: Nguyen)',
                    hintText: 'Nhập vào họ của bạn'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tên đệm & tên (ex: Quang An)',
                    hintText: 'Nhập vào tên đệm & tên của bạn'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Nhập vào email của bạn'
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Số điện thoại',
                    hintText: 'Nhập vào số điện thoại của bạn'
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
