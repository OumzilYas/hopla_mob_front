

//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/Slider.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/home_slider.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/details_page.dart';
import 'package:hopla_front_mob/view/test.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/dialoge.dart';
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
            child: Container(height: height,),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: height*.20,
              decoration:  BoxDecoration(
                color:   Colors.grey.withOpacity(0.65),
                borderRadius:const BorderRadius.only(
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
                            child: InkWell(
                              // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              child:const FaIcon(FontAwesomeIcons.bars,color: Colors.grey,size: 25,),
                              onTap: (){_scaffoldKey.currentState?.openDrawer();},
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
                                      onPressed: () { }
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
            top : 130,
            left: 40.0,
            right: 40.0,
            child:Container(
              decoration:const  BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              height: height*.15,
              width: width*.8,
            ),),
           Positioned(
            top : 300,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Card(
                  color: Colors.transparent,
                  child: Container(
                    width: 110,
                    decoration:  BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
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
                              width: 70,
                              height: 70,
                              child:Center(
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    child:
                                    Icon(FontAwesomeIcons.hardHat,color: Colors.deepOrangeAccent,size: 25,),
                                    onPressed: () {

                                    },
                                  ),
                                ),
                              ),
                              decoration:const  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrangeAccent),
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Text('Rules',style: GoogleFonts.lato(
                                textStyle: TextStyle(color: Colors.orange, letterSpacing: .5,fontWeight: FontWeight.w800),
                              ),),
                            )
                          ],
                        ),
                      ),

                    ),

                  ),
                ),
              ),
            ),),
          Positioned(
              bottom: 80.0,
              left: width*.01,
              right: 0.0,
              child: Container(
                width: 150,
                height: 150,
                child: Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Center(child: Text('GO',style: GoogleFonts.lato(
                      textStyle: const TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 30),
                    ),),)
                  ),
                ),
                decoration:const  BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orangeAccent),
              ),
          ),
          Positioned(
              top: 500.0,
              left: width*.07,
              right: width*.07,
              child: Container(width: 10,height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HoplaButton(Colors.white, width*.4, height*.1, Colors.orangeAccent, 'Inscription', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomeSPage();
                        }));
                      }),
                      HoplaButton(Colors.white, width*.4, height*.1, Colors.grey, 'Community', (){}),

                    ],))),

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
