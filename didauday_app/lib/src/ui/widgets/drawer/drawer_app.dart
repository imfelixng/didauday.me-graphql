import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white,),
                title: Text('Setting', style: TextStyle(color: Colors.white, fontSize: 16,),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.white,),
                title: Text('Terms & Conditions', style: TextStyle(color: Colors.white, fontSize: 16,),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.security, color: Colors.white,),
                title: Text('Privacy policy', style: TextStyle(color: Colors.white, fontSize: 16,),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text('About us', style: TextStyle(color: Colors.white, fontSize: 16,),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_open, color: Colors.white,),
                title: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 16,),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
