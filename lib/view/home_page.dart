

//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/Slider.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/component/weather.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';


class HomePage2 extends StatefulWidget {



  @override
  State<HomePage2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return   Scaffold(
      drawerScrimColor: Colors.grey.withOpacity(0.7),
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
            child: Container(height: height,),
          ),
          Positioned(
            top : 130,
            left: 40.0,
            right: 40.0,
            child:WeatherComp()),
          Positioned(
              top: 52.0,
              left: 20.0,
              child:InkWell(
                onTap: (){_scaffoldKey.currentState?.openDrawer();},
                child : Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color:  Color(0xffDFE6EF),
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child:const Icon(
                    Icons.menu,
                    color: Colors.black87,
                    size: 28,
                  ),

                ),)
          ),
          Positioned(
            top : 300,
            left:15.0,
            right: 15.0,
            child: Container(
              height: 150,
              width: width*.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    decoration:  BoxDecoration(
                      color: Colors.green,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                      },
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  Colors.green,
                                  image:   DecorationImage(
                                    fit: BoxFit.contain,
                                    image:const AssetImage("assets/price-tag.png"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text('Offers',style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800),
                              ),),
                            )
                          ],
                        ),
                      ),

                    ),

                  ),
                  Container(
                    width: 110,
                    decoration:  BoxDecoration(
                      color:  Color(0xff002AD4),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                      },
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:  Color(0xff002AD4),
                                  image:   DecorationImage(
                                    fit: BoxFit.contain,
                                    image:const AssetImage("assets/regulation.png"),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            Center(
                              child: Text('Rules',style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800),
                              ),),
                            )
                          ],
                        ),
                      ),

                    ),

                  ),
                  Container(
                    width: 110,
                    decoration:  BoxDecoration(
                      color: Color(0xffFF9A08),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                    ),
                    child: InkWell(
                      onTap: (){
                      },
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:  Colors.white,

                              ),

                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color:  Color(0xffFF9A08),
                                            image:   DecorationImage(
                                              fit: BoxFit.contain,
                                              image:const AssetImage("assets/star.png"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text('Recommendation',style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 12),
                              ),),
                            )
                          ],
                        ),
                      ),

                    ),

                  ),

                ],
              )
            ),),
          Positioned(
              bottom: 80.0,
              left: 0,
              right: 0.0,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomePage(inProgress: false,dirictions: false,);
                  }));
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration:
                  BoxDecoration(
                    shape: BoxShape.circle,
                    image:   DecorationImage(
                      fit: BoxFit.contain,
                      image:const AssetImage("assets/hopla.png"),

                    ),
                  ),

                ),
              ),
          ),
          Positioned(
              top: 580.0,
              left: width*.45,
              right: width*.07,
              child: Container(width: 10,height: 50,
                  child: Text('Ready ?',style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800),
                  ),),)),


          Positioned(
              top: 500.0,
              left: width*.07,
              right: width*.07,
              child: Container(width: 10,height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoplaButton(Colors.orangeAccent, width*.5, height*.05,Color(0xffDFE6EF), 'Join Us', (){

                      }),

                    ],))),

           Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: BBarH(page: 'h',)),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
