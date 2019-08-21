import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:didauday_app/src/core/enums/connectivity_status.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.none:
        return ConnectivityStatus.OFFLINE;
      default:
        return ConnectivityStatus.OFFLINE;
    }
  }
}