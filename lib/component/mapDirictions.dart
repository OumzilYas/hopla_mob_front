import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/widgets/scooter_container.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapDPage extends StatefulWidget {
  const MapDPage({Key? key, required this.press}) : super(key: key);

  final  press;

  @override
  State<MapDPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MapDPage> {
  static LatLng Marina = LatLng(33.60414810795366, -7.645660128330507);
  static LatLng chfinja  = LatLng(33.6022700934326, -7.64625571821334);
  static LatLng Venezia = LatLng(33.60281225109011, -7.6455879136084945);
  static LatLng maPosition = LatLng(33.60281225109011, -7.6455879136084945);
  var location = new Location();
  bool ?_serviceEnabled;
  PermissionStatus ?_permissionGranted;
  LocationData ?_locationData;
  double latitude =3.60414 ;double longitude=-7.64566;
  var points = <LatLng>[
  ];
  var points2= <LatLng>[];
  local()async{
    _serviceEnabled = await location.serviceEnabled();
    try{
      if (!_serviceEnabled!) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled!) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      latitude = (_locationData?.latitude ?? 3.60414 );
      longitude = (_locationData?.longitude ?? -7.64566);
      print(_locationData?.latitude.toString());
      print(_locationData?.longitude.toString());
      setState(() {
        maPosition = LatLng(latitude, longitude);
        points2 =  <LatLng>[
          maPosition,
          chfinja,
        ];
      });
    }
    catch(e){
      print(e);
    }

  }
  @override
  void initState() {
    local();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var markers = <Marker>[
      Marker(
        width: 50.0,
        height: 50.0,
        point: Marina,
        builder: (ctx) => Container(
            child: GestureDetector(
                onTap:widget.press,
                child:ScooterContainer()
            )),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: chfinja,
        builder: (ctx) => Container(
            child: GestureDetector(
                onTap:widget.press,
                child:ScooterContainer()
            )),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: Venezia,
        builder: (ctx) => Container(
            child: GestureDetector(
                onTap:widget.press,

                child: ScooterContainer()
            )),
      ),
      Marker(
        width: 50.0,
        height: 50.0,
        point: maPosition,
        builder: (ctx) => Container(
            child: GestureDetector(
              onTap:widget.press,
              child: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
            )),
      ),

    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                center: maPosition,
                zoom: 10.5,
                maxZoom: 100.0,
                minZoom: 3.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                        points: points2,
                        strokeWidth: 4.0,
                        color: Colors.purple),
                  ],
                ),
                MarkerLayerOptions(markers: markers),
              ],
            ),
            Positioned(
              top: 300.0,
              right: 20.0,
              child: Container(
                  height: 90,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          child: Icon(
                            Icons.gps_fixed,
                            color: Colors.grey,
                          ),
                          onTap:(){local();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return HomePage(inProgress: true,dirictions: false,);
                          }));}
                      ),
                      SizedBox(height: 15,),
                      InkWell(
                        child: Icon(
                          Icons.near_me,
                          color: Colors.grey,
                        ),
                        onTap: (){
                          print("ppD");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return HomePage(inProgress:true,dirictions: true,);
                          }));

                        },
                      )

                    ],
                  )

              ),
            ),

          ],
        ),
      ),
    );
  }
}
