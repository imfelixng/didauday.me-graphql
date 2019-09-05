import 'package:didauday_app/src/ui/helpers/image_mock.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceMapView extends StatefulWidget {
  @override
  _PlaceMapViewState createState() => _PlaceMapViewState();
}

class _PlaceMapViewState extends State<PlaceMapView> {
  ScrollController _scrollController;
  GoogleMapController mapController;
  final LatLng _center = const LatLng(16.0544, 108.2022);
  final Set<Marker> _markers = Set();
  List<Map<String, dynamic>> locations = [
    {
      "name": "Non Nước",
      "city": "Đà Nẵng",
      "images": [
        ImageMock.img_location,
      ],
      "_id": "non_nuoc",
      "coordinates": [
        16.0045, 108.2618
      ]
    },
    {
      "name": "Chùa Linh Ứng",
      "city": "Đà Nẵng",
      "images": [
        ImageMock.img_location,
      ],
      "_id": "chua_linh_ung",
      "coordinates": [
        16.1003, 108.2779
      ]
    },
    {
      "name": "Bà Nà Hills",
      "city": "Đà Nẵng",
      "images": [
        ImageMock.img_location,
      ],
      "_id": "ba_na",
      "coordinates": [
        15.9977, 107.9881
      ]
    }
  ];

  int indexSelected = 0;


  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      locations.forEach((location) {
        var coordinates = location["coordinates"];
        _markers.add(
          Marker(
            onTap: () {
              String id = location['_id'];
              var item = locations.firstWhere((item) => item["_id"] == id);
              int index = locations.indexOf(item);
              setState(() {
                indexSelected = index;
              });
              _scrollController.animateTo(index.toDouble() * 250 + (index) * 20,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
            markerId: MarkerId(location["_id"]),
            position: LatLng(coordinates[0], coordinates[1]),
            infoWindow: InfoWindow(title: location["name"]),
          ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Places location'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
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
                bottom: 10,
                left: 0,
                child: Container(
                  height: 255,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      var location = locations[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            indexSelected  = index;
                          });
                          _scrollController.animateTo(index.toDouble() * 250 + (index) * 20,
                              duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                          mapController.animateCamera(CameraUpdate.newLatLng(
                            LatLng(location["coordinates"][0], location["coordinates"][1]),
                            ),
                          );
                        },
                        child: Container(
                          width: 250,
                          margin: EdgeInsets.only(right: index != locations.length - 1 ? 20 : 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(3, 3),
                                blurRadius: 6,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    width: 250,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                          image: NetworkImage(location["images"][0]),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: indexSelected == index ? Container(
                                      child: Icon(Icons.check_circle_outline),
                                    ) : Container(),
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      location["name"],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      location["city"],
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
