

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/pathway_page_clone.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';



class PathWay extends StatefulWidget {



  @override
  State<PathWay> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PathWay> {
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

  bool isRunning = false;
  bool lock = false ;

  void initState() {
    // TODO: implement initState
    asyncMethod();

  }
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return   Scaffold(
      drawerScrimColor: Color(0xffff9a08).withOpacity(0.7),
      key: _scaffoldKey,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
        width: width*.8,color: Colors.white,),
      body:   Stack(
        children:  [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(height: height,
              decoration:const
              BoxDecoration(
                color:  Color(0xff7c94b6),
                image:   DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/MAPS2.png"),
                ),
              ),
              ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBarH((){_scaffoldKey.currentState?.openDrawer();}),),
          Positioned(
            bottom: 90.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              height: height*.3,
              width: width*.8,
              decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              child: Row(
                children: [
                SizedBox(width: width*.05,),
                Container(
                    decoration:const  BoxDecoration(
                      color: Color(0xffff9a08),
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                  height: height*.27,
                  width: width*.35,
                  child: Column(children: [
                    const SizedBox(height: 2,),
                    Container(height: height*.15,width: width*.33,
                      decoration:const
                      BoxDecoration(
                        image:   DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/e_scooter.png"),
                        ),
                      ),),
                    const SizedBox(height: 15,),
                    const Text(
                      'Xiomi ',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 25,
                        color:  Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Battery ',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 15,
                        color:  Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      '80%',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 15,
                        color:  Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],)
                ),
                SizedBox(width: width*.05,),
                Container(
                      decoration:const  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                      ),
                      height: height*.27,
                      width: width*.45,
                      child: Column(children: [
                        Container(height: height*.1,width: width*.23,
                          decoration:const
                          BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/distance.png"),
                            ),
                          ),),
                        Container(height: height*.065,width: width*.7,
                          child:  Center(
                            child: Countdown(
                                countdownController: countdownController1 ,
                                builder: (_, Duration time) {
                                  return Text(
                                    ' ${time.inHours}hours: ${time.inMinutes % 60}min : ${time.inSeconds % 60}sec',
                                    style:  const TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      color:   Color(0xff828282) ,
                                    ),
                                  );
                                }),
                          ),
                          decoration:const BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/shadowTimer.png"),
                            ),
                          ),),
                        Center(
                            child: Countdown(
                                countdownController: countdownController2 ,
                                builder: (_, Duration time) {
                                  return Text(
                                    ' ${time.inHours}hours: ${time.inMinutes % 60}min : ${time.inSeconds % 60}sec',
                                    style:  const TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 10,
                                      color:   Colors.red ,
                                    ),
                                  );
                                }),
                         ),
                        const SizedBox(height: 12,),
                        Container(height: height*.065,width: width*.7,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child:Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      child:
                                      Icon(isRunning ? Icons.pause : Icons.play_arrow
                                      ,color: Colors.orangeAccent,),
                                      onPressed: () {
                                        if (!countdownController1.isRunning) {
                                          countdownController1.start();
                                          countdownController2.stop();

                                          setState(() {
                                            isRunning = true;
                                          });
                                        } else {
                                          countdownController1.stop();
                                          countdownController2.start();

                                          setState(() {
                                            isRunning = false;
                                          });
                                        }

                                      },
                                    ),
                                  ),
                                ),
                                decoration:const  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orangeAccent,),
                              ),

                              Container(
                                width: 50,
                                height: 50,
                                child:Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      child:
                                      Icon(lock ? Icons.lock_open :  Icons.lock ,color: Colors.green,),
                                      onPressed: () {
                                        setState(() {
                                          lock = !lock;
                                        });

                                      },
                                    ),
                                  ),
                                ),
                                decoration:const  BoxDecoration(
                                    shape: BoxShape.circle,
                                  color: Colors.green,),
                              ),

                              Container(
                                width: 50,
                                height: 50,
                                child:Center(
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      child:
                                      Icon(Icons.stop,color: Colors.deepOrangeAccent,),
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return PathWay2();
                                        }));
                                      },
                                    ),
                                  ),
                                ),
                                decoration:const  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.deepOrangeAccent),
                              ),


                            ],
                          )
                         ),
                      ],)
                  ),

                ],),
            ),
          ),
          Positioned(
            top : 90,
            left: 40.0,
            right: 40.0,
            child:Container(
              decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              height: height*.15,
              width: width*.8,
              child: Row(children: [
                Container(
                  child:Center(
                    child: Container(height: height*.1,width: width*.3,
                      decoration:const
                      BoxDecoration(
                        image:   DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/distance38.png"),
                        ),
                      ),),
                  ) ,
                ),
                Container(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Casablanca',
                        style:   TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 17,
                          color:  Color(0xffff9a08),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: height*.05,),
                      Center(child: SizedBox(child: HoplaButton(Color(0xffffffff),width*.42,height*.03, Color(0xffff9a08), "CasaPort",(){

                      }),),),
                    ],) ,
                )
              ],),
            ),),

          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: BBarH()),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
