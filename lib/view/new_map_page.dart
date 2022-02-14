import 'dart:async';
import 'package:flutter/cupertino.dart';
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
import 'package:line_icons/line_icons.dart';
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
  bool inProgress = false ;
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
    allMarkers.add(Marker(
        markerId: MarkerId('maPos'),
        draggable: false,
        position: maPosition));

  }
  @override
  void initState() {
    local();
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
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
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
                      height: height*.2,
                      width: width*.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      child: Row(children: [
                        Stack(
                          children: <Widget>[
                            Container(
                              height: height*.11,
                              width: width*.24,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  child: Image.network(coffeeShops[index].thumbNail, fit: BoxFit.cover)),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child:  Container(
                                width: 20,
                                height:20,
                                padding: const EdgeInsets.all(1),
                                decoration:  BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child:  Center(
                                  child: Text('5',style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: height*.01,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 5.0),
                        SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coffeeShops[index].shopName,
                                  style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: height*.02,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height:height*.005),
                                Text(
                                  coffeeShops[index].address,
                                  style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: height*.015,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height:height*.005),
                                SizedBox(
                                  width: width*.4,
                                  child: Text(
                                    coffeeShops[index].description,
                                    style:  TextStyle(
                                        fontFamily: 'Product Sans',
                                        fontSize: height*.012,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )
                              ]),
                        )
                      ])))
            ])),
      );
    }

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
                 CameraPosition(target: maPosition, zoom: 13.0),
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
              bottom:inProgress ?0: 10,
              left: 0,
              right: 0,
              child: station?Container(
                width: width,

                child: SlidingUpPanel(
                    maxHeight:_panelHeightOpen ,
                    minHeight: _panelHeightClosed2,
                    parallaxEnabled: false,
                    onPanelClosed: (){
                      setState(() {
                        if(inProgress){
                          _panelHeightClosed2 = height*.08;
                        }

                      });
                    },
                    onPanelOpened: (){
                      if(inProgress){
                        _panelHeightClosed2 = height*.08;
                      }
                    },
                    parallaxOffset: .5,
                    panelBuilder: (sc) => _panel(sc),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 17,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius:const  BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0)),
                    onPanelSlide: (double pos)  {
                      if (!inProgress) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: height*.35,
                      width: width*.9,
                      decoration:  BoxDecoration(
                        color:  Colors.white.withOpacity(0.95),
                        border: Border.all(color: Colors.black,width: 2),
                        borderRadius:const BorderRadius.all(Radius.circular(30)),
                      ),
                      child:ListView(
                        padding:  EdgeInsets.all(0),
                        children: <Widget>[
                           SizedBox(
                            height: height*.005,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(width: width*.2,),
                              InkWell(child:Icon(LineIcons.timesCircle,color: Colors.black,size: 30,),
                                onTap: (){
                                  setState(() {
                                    details=false;
                                  });
                                },)
                            ],
                          ),
                          InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Chfinja Station",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',color: Colors.blueGrey, letterSpacing: .5,fontWeight: FontWeight.w400, fontSize: height*.03,
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height*.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: height*.15,
                                width: width*.8,
                                child:GridView.count(
                                    padding: EdgeInsets.zero ,// set padding to zero
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 0.0,
                                    mainAxisSpacing: 0.0,
                                    childAspectRatio : 1.8,
                                    children: List.generate(6, (index) {
                                      return Center(
                                          child:Container(
                                            height: 100,
                                            width: 100,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(height: height*.05,width: width*.1,
                                                  decoration:const BoxDecoration(
                                                    image:   DecorationImage(
                                                      fit: BoxFit.fitHeight,
                                                      image: AssetImage("assets/e_scooter.png"),
                                                    ),
                                                  ),),
                                                Column(
                                                  children: <Widget>[
                                                    SizedBox(height: height*.003,),
                                                    Icon( Icons.battery_full_rounded, color: Colors.orange,size: 32,),
                                                    Text(
                                                      "80%",
                                                      style: TextStyle(
                                                        fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: height*.01,),

                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                      );
                                    }
                                    )),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: height*.01,
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
                                          border: Border.all(color: Colors.blueGrey)
                                      ),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(width: width*.01,),
                                          Container(height: height*.05,width: width*.12,
                                            decoration:const BoxDecoration(
                                              image:   DecorationImage(
                                                fit: BoxFit.fitHeight,
                                                image: AssetImage("assets/scan.png"),
                                              ),
                                            ),),
                                          Text('Scan  Code',style: TextStyle(
                                              fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontSize: height*.02,fontWeight: FontWeight.w400),
                                          ),
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
                ],
              )
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
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18)),
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
                        child: Container(
                          height: height*.055,
                          width: width*.27,
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              border: Border.all(color: Colors.white)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                isRunning ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 32,
                              ),
                              Text(isRunning?'Pause':'Play',
                                style: TextStyle(fontFamily: 'Product Sans', color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: height*.03,),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width:width*.05,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('   Duration : ',style:  TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: height*.014,
                            color:  Colors.white,
                          ),),
                          Countdown(
                              countdownController: countdownController1 ,
                              builder: (_, Duration time) {
                                return Text(
                                  ' ${time.inHours}: ${time.inMinutes % 60} : ${time.inSeconds % 60}',
                                  style: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: height*.03,),

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
                            fontSize: height*.015,
                            color:  Colors.white,
                          ),),
                          SizedBox(height: height*.012,),
                          Countdown(
                              countdownController: countdownController2 ,
                              builder: (_, Duration time) {
                                return Text(
                                  '${time.inMinutes % 60} : ${time.inSeconds % 60}',
                                  style:  TextStyle(color: Colors.white, fontFamily: 'Product Sans',
                                      letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: height*.015,),

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
                Container(
                  height: height*.12,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      border: Border.all(color: Colors.black)
                  ),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trip in Progress ',
                            style: TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: height*.026,),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                      SizedBox(height: height*.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Distance ',
                                style:TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: height*.019,),

                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: height*.01,),
                              Text(
                                '353 m',
                                style:
                                TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: height*.015,),

                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(width: width*.055,),
                          Column(
                            children: [
                              Text(
                                'Life ',
                                style:TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: height*.018),

                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: height*.01,),
                              Text(
                                '90 KM',
                                style:TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: height*.015),

                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(width: width*.055,),
                          Column(
                            children: [
                              Text(
                                'Power ',
                                style:  TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: height*.018),

                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: height*.01,),
                              Text(
                                '71 %',
                                style:TextStyle(fontFamily: 'Product Sans',color: Colors.green, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: height*.015),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                        ],
                      )

                    ],
                  ),
                )
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
                          Text(isLocked?'Unlock Scooter':'lock Scooter',style:TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: height*.016,fontWeight: FontWeight.w500),
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
                          Text('End trip',style: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: height*.016,fontWeight: FontWeight.w500),
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
    asyncMethod();
    initMapIcon();
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
        zoom: 16.0,
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
        zoom: 16.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
  moveCamera2() {
    setState(() {
      _polylines.clear();
    });
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: maPosition,
        zoom: 16.0,
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
      shopName: 'Chfinja MASTERS',
      address: '5 Scooters',
      description:
      'Chfinja MASTERS comfort eats in a basic diner-style setting',
      locationCoords: const LatLng(33.602210976662654, -7.64639239053210855),
      thumbNail:
      'https://lh5.googleusercontent.com/p/AF1QipN3Q_nyoaOYYEhotemJ8_9NtJttSIdBSSxClWlV=w408-h272-k-no'),
  Coffee(
      shopName: 'Aparthotel Adagio',
      address: '5 Scooters',
      description:
      'Small spot draws serious caffeine lovers with wide selection of brews & baked goods.',
      locationCoords: const LatLng(33.58563364312847, -7.645630376221931),
      thumbNail:
      'https://lh5.googleusercontent.com/proxy/a8VDiWKc6RYMmnc1HSkaGPHwvBobvQvzULMUiDSVZOwozn2pHQxFBO_d3rTIVNgL3d3MSTg7iaqGv7bgI1F-u70m5hL13p4_Ud7SeffnnHnqbVCF-sp87WwC2Da1IbDJTijYkctqgxxfLW9g3_h9nz5nY6LEArs=w408-h249-k-no'),
  Coffee(
      shopName: 'ONOMO',
      address: '5 Scooters',
      description:
      'ONOMO Hotel Casablanca City Center.',
      locationCoords: const LatLng(33.58630836112247, -7.639069688677604),
      thumbNail:
      'https://lh5.googleusercontent.com/proxy/lj_-1_lbofa_7rjcf0XN1NeCSRKFJ5GY5yJxhD9dII9KyJJUPoWRbH3Yc-ByuxDUj_Q988KNsL3T5PvMt3UtpMtjZVwQ_I8_vQCUPiBemkQeq0Ak3sXnMs9RVqlg7nEx6t7d47Z_-piL1MSav3EcAQ2eosMWbw=w408-h306-k-no'),
];

