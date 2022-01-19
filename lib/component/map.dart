import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';

class MapPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<MapPage> {
  bool selectedStations =false;
  Set<Marker> _markers = <Marker>{};

  void asyncMethod() async {
    _markers.add(
      Marker(
          markerId: MarkerId('downloadResizePicture'),
          icon: await MarkerIcon.markerFromIcon(Icons.electric_scooter_outlined, Colors.green, 150),
          position: LatLng(33.602484704928294, -7.646212803157991),
          onTap: (){
            setState(() {
              selectedStations=true;
            });
          }
      ),

    );

    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    asyncMethod();

  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(33.602484704928294, -7.646212803157991), zoom: 15),
        markers: _markers,

    );
  }

}
