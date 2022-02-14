import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  static LatLng Marina = LatLng(33.60414810795366, -7.645660128330507);
  static LatLng chfinja  = LatLng(33.6022700934326, -7.64625571821334);
  static LatLng Venezia = LatLng(33.60281225109011, -7.6455879136084945);
  static LatLng maPosition = LatLng(33.60281225109011, -7.6455879136084945);
  static LatLng center = LatLng(33.60347214850871, -7.646599038038314);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.60358831533135, -7.646577580365483),
    zoom: 16.5,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target:LatLng(33.60358831533135, -7.646577580365483) ,
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;
  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];
    points.add(chfinja);
    points.add(LatLng(33.60287416213128, -7.646169978937471));
    points.add(LatLng(33.603006854527365, -7.646754134266143));
    points.add(LatLng(33.60423898843145, -7.646215497535123));
    points.add(LatLng(33.60410629793479, -7.645479613535697));

    return points;
  }
  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.orangeAccent,
      width: 5,
      points: _createPoints(),
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }
  var  _markers = <Marker>{};
  void asyncMethod() async {
    _markers.add(
      Marker(
          markerId: MarkerId('downloadResizePicture'),

          icon: await MarkerIcon.markerFromIcon(Icons.electric_scooter_outlined, Colors.green, 100),
          position: chfinja,
          onTap: (){
            setState(() {
            });
          }
      ),

    );
    _markers.add(
      Marker(
          markerId: MarkerId('download'),
          icon: await MarkerIcon.markerFromIcon(Icons.location_on, Colors.green, 100),
          position:Marina,
          onTap: (){
            setState(() {
            });
          }
      ),

    );
    setState(() {

    });
  }
  late BitmapDescriptor pinLocationIcon;
   Completer<GoogleMapController> ?controller = Completer();
  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icon.png').then((onValue) {
      pinLocationIcon = onValue;
    });
    _add();
    asyncMethod();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GoogleMap(
        polylines: Set<Polyline>.of(_mapPolylines.values),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}