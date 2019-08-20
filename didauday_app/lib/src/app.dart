import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/router/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      onGenerateRoute: generateRoute,
    );
  }
}
