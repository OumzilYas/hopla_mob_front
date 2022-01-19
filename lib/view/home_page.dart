

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/Slider.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/details_page.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';


class HomePage extends StatefulWidget {



  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


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
                    fit: BoxFit.contain,
                    image: AssetImage("assets/MAPS2.png"),
                  ),
                ),
              child: MapPage(),),
            ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: height*.14,
              decoration:const  BoxDecoration(
                  color:  Color(0xffff9a08),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                ),

              ),
              child: Center(
                child:Container(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: width*.05,),
                      Container(
                          width: width*.12,
                          height: width*.12,
                          decoration: const  BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        child: Center(
                          child: IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon:const FaIcon(FontAwesomeIcons.bars,color: Colors.grey,size: 25,),
                              onPressed: () { _scaffoldKey.currentState?.openDrawer();}
                          ),),                      ),
                      SizedBox(width: width*.05,),
                      SizedBox(
                        width: width*.54,
                        height: height*.055,
                        child: Container(
                          decoration:const  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),

                          ),
                          child: Row(
                            children: [
                            IconButton(
                                // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                  icon:const FaIcon(FontAwesomeIcons.search,color: Colors.grey,size: 18,),
                                  onPressed: () { _scaffoldKey.currentState?.openDrawer();}
                              ),
                              Container(
                                width: width*.4,
                                height: height*.045,
                                child:  TextField(
                                  decoration:  InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Search locations',
                                    hintStyle: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                                    ),
                                  ),

                                ),
                              )
                            ],
                          )
                        ),
                      ),
                      SizedBox(width: width*.02,),
                      SizedBox(
                        width: width*.15,
                        child: Center(
                          child: IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon:const FaIcon(FontAwesomeIcons.slidersH,color: Colors.white,size: 35,),
                              onPressed: () { print("Pressed"); }
                          ),),
                      ),
                      SizedBox(width: width*.05,)

                    ],
                  ),
                )
              ),
              ),),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(child: Row(
              children: [

              ],
            ),),
          ),
          Positioned(
            top : height*.5,
            left: 0.0,
            right: 0.0,
            child: ScooterSlider(),),

          Positioned(
            bottom: 80.0,
            left: width*.35,
            right: 0.0,
            child: Container(width: 10,height: 50,
            child: Row(
              children: [HoplaField('Select', 'type',() async {
                 await BarcodeScanner.scan();

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailsPage();
                }));
              })],))),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(width: 100,height: 80,
            child: Row(
              children: [
                SizedBox(width: width*.051,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: width*.1,
                    width: width*.1,
                    decoration:const BoxDecoration(
                      image:   DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/home-button.png"),
                      ),
                    ),),
                ),
                SizedBox(width: width*.28,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: width*.1,
                    width: width*.1,
                    decoration:const BoxDecoration(
                      image:   DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/wallet.png"),
                      ),
                    ),),
                ),
                SizedBox(width: width*.3,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: width*.1,
                    width: width*.1,
                    decoration:const BoxDecoration(
                      image:   DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images.png"),
                      ),
                    ),),
                ),


              ],
            ),
              decoration:const BoxDecoration(
                color: Colors.white,
            ),)),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
