import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceMapView extends StatefulWidget {
  final Function onClose;
  PlaceMapView({this.onClose});
  @override
  _PlaceMapViewState createState() => _PlaceMapViewState();
}

class _PlaceMapViewState extends State<PlaceMapView> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(16.0544, 108.2022);
  final Set<Marker> _markers = Set();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers
        ..add(
          Marker(
            markerId: MarkerId('non_nuoc_da_nang'),
            position: LatLng(16.0045, 108.2618),
          ),
        )
        ..add(
          Marker(
            markerId: MarkerId('linh_ung_da_nang'),
            position: LatLng(16.1003, 108.2779),
          ),
        )
        ..add(
          Marker(
            markerId: MarkerId('ba_na_da_nang'),
            position: LatLng(15.9977, 107.9881),
          ),
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            markers: _markers,
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                widget.onClose();
              },
              child: Icon(Icons.close, size: 30,),
            ),
          )
        ],
      ),
    );
  }
}
