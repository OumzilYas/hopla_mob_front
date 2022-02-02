
import 'dart:ui';

//import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/tripEndPage.dart';
import 'package:hopla_front_mob/widgets/info_dialoge.dart';
import 'package:hopla_front_mob/widgets/scooter_container.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';

import 'mapDirictions.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.inProgress,required this.dirictions}) : super(key: key);

  final bool inProgress ;
  final bool dirictions ;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  bool ?inProgress  ;
  bool isRunning = false;
  bool isLocked = false;

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

    });
    countdownController1.start();

    setState(() {
      isRunning = true;
    });
  }
  @override
  void initState() {
    inProgress = widget.inProgress;
    print("----------------------------------------"+inProgress.toString());
    super.initState();
    asyncMethod();

    _fabHeight = _initFabHeight;
  }
  bool station =true;

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    _panelHeightClosed =  height*.37;
    _panelHeightOpen = height*.37;
    var  points = <LatLng>[
      LatLng(33.6022700934326, -7.64625571821334),
      LatLng(33.60287416213128, -7.646169978937471),
      LatLng(33.603006854527365, -7.646754134266143),
      LatLng(33.60423898843145, -7.646215497535123),
      LatLng(33.60410629793479, -7.645479613535697),
    ];
    return Scaffold(
      drawerScrimColor: Colors.green.withOpacity(0.7),
      key: _scaffoldKey,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),),
        width: width*.8,color: Colors.white,),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(height: height,
              child: !widget.dirictions?MapPage(progress : inProgress!,press: (){setState(() {
                station = false;
              });},):MapDPage(progress : inProgress!,press: (){setState(() {
                station = false;
              });},)),
          ),
          station && !inProgress! ?
          Positioned(
            bottom : 40,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: height*.1,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Colors.white,
                  child: Container(
                    width: width*.65,
                    decoration: const  BoxDecoration(
                      borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          station = false;
                        });
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child:  SizedBox(
                                height: 50,
                                width: 50,
                                child:ScooterContainer(),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Chfinja',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 14),
                                ),),
                                SizedBox(height: height*.01,),
                                Text('064646556',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 15),
                                ),),

                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: width*.2,
                                  height: height*.06,
                                  child: Center(child: Row(
                                    children: [
                                      Icon(Icons.pin_drop,color: Colors.white,size: 20,),
                                      SizedBox(width: 7,),
                                      Text('3.5 KM',style: GoogleFonts.lato(
                                        textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w500),
                                      ),),                            ],
                                  ),),
                                  decoration:const  BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10),),
                                      color: Color(0xff00B72B)),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                    ),

                  ),
                ),
              ),
            ),)
              :
          SlidingUpPanel(
              maxHeight:_panelHeightOpen ,
              minHeight: inProgress! ? height*.08 :_panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              panelBuilder: (sc) => _panel(sc),
              borderRadius:const  BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              onPanelSlide: (double pos) => () {
                if (!inProgress!) {
                  print("ppp");
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
          // the fab
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


          //the SlidingUpPanel Title

        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child:!inProgress!? ListView(
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(child:Icon(FontAwesomeIcons.angleDoubleDown,color: Colors.green,size: 30,)
                  ,
                  onTap: (){
                    setState(() {
                      station = true;
                    });
                  },)
              ],
            ),
            const SizedBox(
              height: 18.0,
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
              height: height*.03,
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
                  /*
                var result = await BarcodeScanner.scan();

                print(result.type); // The result type (barcode, cancelled, failed)
                print(result.rawContent); // The barcode content
                print(result.format); // The barcode format (as enum)
                print(result.formatNote);

                 */
                  setState(() {

                    inProgress =true;
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
                            Text('Scan Qr Code',style: GoogleFonts.lato(
                              textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w600),
                            ),),
                            SizedBox(width: width*.01,),
                          ],
                        )),

                  ],)
            )
          ],
        ):
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
                              builder: (BuildContext context) => const InfoDialoge());                        }
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

}