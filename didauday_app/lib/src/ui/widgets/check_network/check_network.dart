import 'package:didauday_app/src/core/enums/connectivity_status.dart';
import 'package:didauday_app/src/ui/widgets/dialog/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckNetwork extends StatelessWidget {
  final Widget child;
  CheckNetwork({ @required this.child });

  @override
  Widget build(BuildContext context) {

    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    return SafeArea(
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            child,
            connectionStatus == ConnectivityStatus.OFFLINE ? Positioned(
                top: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    MessageDialog.showMsgDialog(context, "No network connection", "Please check your wifi or mobile internet connection and try again!");
                  },
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.5,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'No network connection...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
