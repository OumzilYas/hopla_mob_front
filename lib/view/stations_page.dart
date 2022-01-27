

//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/Slider.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/component/stations_slider.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/details_page.dart';
import 'package:hopla_front_mob/view/scooters_page.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';


class StationsPage extends StatefulWidget {



  @override
  State<StationsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StationsPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return   Scaffold(
      drawerScrimColor: const Color(0xffff9a08).withOpacity(0.7),
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
                image:   DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/MAPS2.png"),
                ),
              ),),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBarH((){_scaffoldKey.currentState?.openDrawer();}),),
          Positioned(
            top : 700,
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
                    width: width*.6,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomePage();
                        }
                        )
                        );
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child:  SizedBox(
                                height: 30,
                                width: 30,
                                child:Center(child: Image.asset("assets/icon.png",height: 30,width:30,),),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Hopla Cournich',style: GoogleFonts.lato(
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
                                      color: Colors.orangeAccent),
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
            ),),

          const Positioned(
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
