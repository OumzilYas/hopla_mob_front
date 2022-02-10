import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/info_dialoge.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:maps_curved_line/maps_curved_line.dart';

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
  late BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller2 = Completer();
  bool details = false ;
  bool ?inProgress  ;
  bool isRunning = true;
  bool isLocked = false;
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  double _panelHeightClosed2 = 300;
  bool station = false;
  bool inAsyncCall = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  CountdownController countdownController1 =
  CountdownController(duration: Duration(seconds: 30,minutes: 15,hours: 1), onEnd: () {
    print('onEnd');
  });
  CountdownController countdownController2 =
  CountdownController(duration: Duration(seconds: 30,minutes: 1,hours: 0), onEnd: () {
    print('onEnd');
  });
  void asyncMethod() async {
    setState(() {
      countdownController1.start();

    });

    setState(() {
      isRunning = true;
    });
  }
  static LatLng maPosition = LatLng(33.60281225109011, -7.6455879136084945);
  static LatLng chfinja  = LatLng(33.6022700934326, -7.64625571821334);

  var location = new Location();
  bool ?_serviceEnabled;
  PermissionStatus ?_permissionGranted;
  LocationData ?_locationData;
  double latitude =3.60414 ;double longitude=-7.64566;

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
      });
    }
    catch(e){
      print(e);
    }

  }
// make sure to initialize before map loading
  initMapIcon()async{

    for (var element in coffeeShops) {
      BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(0.1, 0.1)),
        "assets/stations/p.png",
      );
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName),
          draggable: false,
          icon: markerbitmap,
          infoWindow:
          InfoWindow(title: element.shopName, snippet: element.address),
          position: element.locationCoords));
    }

  }
  @override
  void initState() {
    initMapIcon();
    asyncMethod();
    super.initState();
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
            setState(() {
              details=true;
            });
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
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    _panelHeightClosed =  height*.37;
    _panelHeightOpen = height*.37;
    return Scaffold(
        drawerScrimColor: Colors.grey.withOpacity(0.7),
        key: _scaffoldKey,
        drawer:  Container(child: Drawer(
          child: DrawerComp(),),
          width: width*.8,color: Colors.white,),
        body: ModalProgressHUD(
            dismissible: true,
            inAsyncCall: inAsyncCall,
            progressIndicator: const SpinKitThreeBounce(color: Colors.green,size: 60.0,),
            child : Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition:
                 CameraPosition(target: maPosition, zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
                polylines: _polylines, // Add constructed polyline for curved line
              ),
            ),
            Positioned(
              top: 52.0,
              right: 20.0,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 28,
                ),

              ),
            ),
            Positioned(
                top: 52.0,
                left: 20.0,
                child:InkWell(
                  onTap: (){_scaffoldKey.currentState?.openDrawer();},
                  child : Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child:const Icon(
                      Icons.menu,
                      color: Colors.grey,
                      size: 28,
                    ),

                  ),)
            ),
            !details?
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
            ):
            Positioned(
              bottom: 0,
              child: station?Container(
                width: width,
                child: SlidingUpPanel(
                    maxHeight:_panelHeightOpen ,
                    minHeight: _panelHeightClosed2,
                    parallaxEnabled: false,
                    onPanelClosed: (){
                      setState(() {
                        if(inProgress!){
                          _panelHeightClosed2 = height*.08;
                        }

                      });
                    },
                    onPanelOpened: (){
                      if(inProgress!){
                        _panelHeightClosed2 = height*.08;
                      }
                    },
                    parallaxOffset: .5,
                    panelBuilder: (sc) => _panel(sc),
                    borderRadius:const  BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    onPanelSlide: (double pos)  {
                      if (!inProgress!) {
                        setState(() {
                          station = true;
                        });
                      } else {
                        setState(() {
                          _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                              _initFabHeight;
                        });

                      }
                    }
                ),
              ):
              Container(
                height: height*.35,
                width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  ),
                  child:ListView(
                  padding:  EdgeInsets.all(0),
                  children: <Widget>[
                    const SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(child:Icon(FontAwesomeIcons.angleDoubleDown,color: Colors.green,size: 30,)
                          ,
                          onTap: (){
                            setState(() {
                              details=false;
                            });
                          },)
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Chfinja Station",
                            style: GoogleFonts.lato(
                              textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height*.02,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon( Icons.electric_scooter, color: Colors.green,size: 30,),
                            Text(
                              "Xiomi 1",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon( Icons.battery_full_rounded, color: Colors.green,size: 30,),
                                Text(
                                  "80%",
                                  style: GoogleFonts.lato(
                                    textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "90 Km",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon( Icons.electric_scooter, color: Colors.green,size: 30,),
                            Text(
                              "Xiomi 1",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon( Icons.battery_full_rounded, color: Colors.green,size: 30,),
                                Text(
                                  "80%",
                                  style: GoogleFonts.lato(
                                    textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "90 Km",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon( Icons.electric_scooter, color: Colors.green,size: 30,),
                            Text(
                              "Xiomi 1",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon( Icons.battery_full_rounded, color: Colors.green,size: 30,),
                                Text(
                                  "80%",
                                  style: GoogleFonts.lato(
                                    textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "90 Km",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    SizedBox(
                      height: height*.03,
                    ),
                    InkWell(
                        onTap: ()async {
                          setState(() {
                            inAsyncCall = true;
                          });
                          Timer(Duration(seconds: 3), () {
                            setState(() {
                              inAsyncCall = false;
                              inProgress =true;
                            });
                          });
                          setState(() {
                            station = true;
                          });
                        },
                        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: height*.06,
                                width: width*.6,
                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10),),
                                    border: Border.all(color: Colors.lightGreen)
                                ),
                                child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: width*.01,),
                                    Icon(FontAwesomeIcons.qrcode,color: Colors.lightGreen,),
                                    Text('Scan  Code',style: GoogleFonts.lato(
                                      textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w600),
                                    ),),
                                    SizedBox(width: width*.01,),
                                  ],
                                )),

                          ],)
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),

                  ],
                )
              ),
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
                          child:const  Icon(
                            Icons.gps_fixed,
                            color: Colors.grey,
                          ),
                          onTap:(){
                            moveCamera2();
                         }
                      ),
                     const  SizedBox(height: 15,),
                      InkWell(
                        child:const  Icon(
                          Icons.near_me,
                          color: Colors.grey,
                        ),
                        onTap: (){
                          moveCameraToCloser();

                        },
                      )

                    ],
                  )

              ),
            ),

          ],
        )));

  }
  final Set<Polyline> _polylines = Set();

  Widget _panel(ScrollController sc) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child:
        ListView(
          controller: sc,
          children: <Widget>[
            Container(
              decoration:  BoxDecoration(
                color: isRunning? Color(0xff00B72B) :Colors.orangeAccent,
                borderRadius: const  BorderRadius.only(
                    topLeft: Radius.circular(18.0),
                    topRight: Radius.circular(18.0)),
              ),
              height: height*.08,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: height*.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height*.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width:width*.05,),
                      InkWell(
                        onTap: (){
                          if(!isLocked){
                            if (!countdownController1.isRunning) {
                              countdownController1.start();
                              countdownController2.stop();

                              setState(() {
                                isRunning = true;
                              });
                            }
                            else {
                              countdownController1.stop();
                              countdownController2.start();

                              setState(() {
                                isRunning = false;
                              });
                            }
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              isRunning ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 32,
                            ),
                            Text(isRunning?'Pause':'Play',
                              style: TextStyle(fontFamily: 'Product Sans', color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width:width*.05,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('   Duration : ',style:  TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 14,
                            color:  Colors.white,
                          ),),
                          Countdown(
                              countdownController: countdownController1 ,
                              builder: (_, Duration time) {
                                return Text(
                                  ' ${time.inHours}: ${time.inMinutes % 60} : ${time.inSeconds % 60}',
                                  style: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 30),

                                );
                              }),
                        ],
                      ),
                      SizedBox(width:width*.1,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Délai',style:  TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 14,
                            color:  Colors.white,
                          ),),
                          SizedBox(height: height*.012,),
                          Countdown(
                              countdownController: countdownController2 ,
                              builder: (_, Duration time) {
                                return Text(
                                  '${time.inMinutes % 60} : ${time.inSeconds % 60}',
                                  style:const  TextStyle(color: Colors.white, fontFamily: 'Product Sans',
                                      letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 15),

                                );
                              }),
                        ],
                      ),
                      SizedBox(width:width*.05,),

                    ],
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: height*.15,width: width*.2, decoration:const
                BoxDecoration(
                  image:   DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/shadow.png"),
                  ),
                ),
                  child: SizedBox(child:  Container(height: height*.15,width: width*.2,
                    decoration:const BoxDecoration(
                      image:   DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/e_scooter.png"),
                      ),
                    ),),),),
                SizedBox(width: width*.05,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trip in Progress ',
                          style: TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 20),

                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: width*.03,),
                        Text(
                          '312 -wgt ',
                          style: TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: height*.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Distance ',
                              style:TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 18),

                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height*.01,),
                            Text(
                              '353 m',
                              style:
                              TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 15),

                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(width: width*.055,),
                        Column(
                          children: [
                            Text(
                              'Life ',
                              style:TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 18),

                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height*.01,),
                            Text(
                              '90 KM',
                              style:TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 15),

                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(width: width*.055,),
                        Column(
                          children: [
                            Text(
                              'Power ',
                              style:  TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 18),

                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height*.01,),
                            Text(
                              '71 %',
                              style:TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                      ],
                    )

                  ],
                ),
              ],),
            SizedBox(height: height*.03,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: height*.06,
                    width: width*.43,
                    decoration:  BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        border: Border.all(color: Colors.black)
                    ),
                    child:InkWell(
                      onTap: (){
                        if (!countdownController1.isRunning) {
                          if(countdownController2.isRunning){
                            setState(() {
                              isLocked = true;
                              countdownController2.stop();
                            });
                          }
                          else {
                            countdownController1.start();
                            countdownController2.stop();

                            setState(() {
                              isRunning = true;
                              isLocked = false;
                            });
                          }
                        } else {
                          countdownController1.stop();
                          countdownController2.start();

                          setState(() {
                            isRunning = false;
                            isLocked = true;

                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: width*.01,),
                          Icon(isLocked?FontAwesomeIcons.unlock:FontAwesomeIcons.lock,color: Colors.white,size: 20,),
                          Text(isLocked?'Unlock Scooter':'lock Scooter',style:TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: 16,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: width*.01,),
                        ],
                      ),
                    )),
                SizedBox(width: width*.03,),
                Container(
                    height: height*.06,
                    width: width*.43,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        color: Color(0xffFF0000),
                        border: Border.all(color:Color(0xffFF0000))
                    ),
                    child:InkWell(
                      onTap: (){
                        if (isLocked){
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => const InfoDialoge());
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: width*.01,),
                          Icon(FontAwesomeIcons.flag,color: Colors.white,),
                          Text('End trip',style: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: 16,fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: width*.01,),
                        ],
                      ),
                    )),

              ],)

          ],
        ));
  }
  void mapCreated(controller)async {
    await local();
    setState(() {
      _controller = controller;
    });
  }
  moveCamera() {
    setState(() {
      _polylines.clear();
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coffeeShops[_pageController.page!.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
  moveCameraToCloser() {
    setState(() {
      _polylines.add(
          Polyline(
            polylineId: PolylineId("line 1"),
            visible: true,
            width: 2,
            //latlng is List<LatLng>
            patterns: [PatternItem.dash(30), PatternItem.gap(10)],
            points: MapsCurvedLines.getPointsOnCurve(maPosition, chfinja), // Invoke lib to get curved line points
            color: Colors.blue,
          )
      );
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: chfinja,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
  moveCamera2() {
    setState(() {
      _polylines.clear();
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: maPosition,
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
      address: '5 Scooters',
      description:
      'Coffee bar chain offering house-roasted direct-trade coffee, along with brewing gear & whole beans',
      locationCoords: const LatLng(33.570127510987604, -7.65940454849847),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipNNzoa4RVMeOisc0vQ5m3Z7aKet5353lu0Aah0a=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Andrews Coffee Shop',
      address: '5 Scooters',
      description:
      'All-day American comfort eats in a basic diner-style setting',
      locationCoords: const LatLng(33.60234054924035, -7.6462636451948605),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipOfv3DSTkjsgvwCsUe_flDr4DBXneEVR1hWQCvR=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Third Rail Coffee',
      address: '5 Scooters',
      description:
      'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: const LatLng(33.55258632500581, -7.610646899803775),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipPGoxAP7eK6C44vSIx4SdhXdp78qiZz2qKp8-o1=w90-h90-n-k-no'),
  Coffee(
      shopName: 'Hi-Collar',
      address: '5 Scooters',
      description:
      'Snazzy, compact Japanese cafe showcasing high-end coffee & sandwiches, plus sake & beer at night.',
      locationCoords: const LatLng(33.54843988414475, -7.627849760794339),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipNhygtMc1wNzN4n6txZLzIhgJ-QZ044R4axyFZX=w90-h90-n-k-no'),
];

