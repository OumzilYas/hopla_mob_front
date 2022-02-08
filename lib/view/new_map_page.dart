import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapAnimation extends StatefulWidget {
  const MapAnimation({Key? key}) : super(key: key);
  @override
  _MapAnimationState createState() => _MapAnimationState();
}
class _MapAnimationState extends State<MapAnimation> {
  late GoogleMapController _controller;
  List<Marker> allMarkers = [];
  late PageController _pageController;
  late int prevPage = 0;

// make sure to initialize before map loading

  @override
  void initState() {

    super.initState();
    for (var element in coffeeShops) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          infoWindow:
          InfoWindow(title: element.shopName, snippet: element.address),
          position: element.locationCoords));
    }
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }
  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }
  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page !- index);
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 145.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 8,
                    ),
                    padding: const EdgeInsets.only(left:5.0),
                    height: 165.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0)),
                          child: Image.network(coffeeShops[index].thumbNail, fit: BoxFit.cover)),
                      const SizedBox(width: 5.0),
                      SingleChildScrollView(
                        child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coffeeShops[index].shopName,
                                style: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                coffeeShops[index].address,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 170.0,
                                child: Text(
                                  coffeeShops[index].description,
                                  style: const TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ]),
                      )
                    ])))
          ])),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition:
                const CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 5.0,
              child: SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: coffeeShops.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _coffeeShopList(index);
                  },
                ),
              ),
            )
          ],
        ));
  }
  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coffeeShops[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
////model
class Coffee {
  String shopName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;
  Coffee(
      {required this.shopName,
        required this.address,
        required this.description,
        required this.thumbNail,
        required this.locationCoords});
}
final List<Coffee> coffeeShops = [
  Coffee(
      shopName: 'Stumptown Coffee Roasters',
      address: '18 W 29th St',
      description:
      'Coffee bar chain offering house-roasted direct-trade coffee, along with brewing gear & whole beans',
      locationCoords: const LatLng(40.745803, -73.988213),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Andrews Coffee Shop',
      address: '463 7th Ave',
      description:
      'All-day American comfort eats in a basic diner-style setting',
      locationCoords: const LatLng(40.751908, -73.989804),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Third Rail Coffee',
      address: '240 Sullivan St',
      description:
      'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: const LatLng(40.730148, -73.999639),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Hi-Collar',
      address: '214 E 10th St',
      description:
      'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
      locationCoords: const LatLng(40.729515, -73.985927),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
];

