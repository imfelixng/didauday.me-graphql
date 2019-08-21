import 'package:didauday_app/src/ui/views/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/enums/connectivity_status.dart';
import 'core/services/connectivity_service.dart';
import 'ui/router/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        builder: (context) => ConnectivityService().connectionStatusController.stream,
    child: MaterialApp(
      home: Home(),
      onGenerateRoute: Router.generateRoute,
    )
    );
  }
}
