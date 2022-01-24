

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/Slider.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/details_page.dart';
import 'package:hopla_front_mob/view/pathway_page.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';


class DetailsPage extends StatefulWidget {



  @override
  State<DetailsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailsPage> {
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
                color:  Color(0xffff9a08),
              ),
              ),
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
            top: 150.0,
            left: 0.0,
            right: 0.0,
            child: Container(height: height*.6,
              child: Column(
                children: [
                  Row(children: [
                    const SizedBox(width: 10,),
                    Container(
                      height: 3,
                      width: 100,
                      color:  Colors.white,
                    ),
                    const SizedBox(width: 5,),
                    const Text(
                      'Xiaomi1',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 25,
                        color:  Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],),
                  Row(children: const[
                    const SizedBox(width: 10,),
                    Text(
                      'Xiaomi1 M365',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        fontSize: 16,
                        color:  Colors.white,
                        fontWeight: FontWeight.w200
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],),

                  const SizedBox(height: 30,),
                  Row(children: [
                    const SizedBox(width: 10,),
                    Container(
                      height: height*.45,
                      width: width*.25,
                      child: Column(
                        children:  [
                          SizedBox(height: height*.02,),
                          const Text(
                            'Battery',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 25,
                              color:  Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            '120 w',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 15,
                              color:  Colors.white,
                              fontWeight: FontWeight.w200

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height*.07,),
                          const Text(
                            'Speed',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 25,
                              color:  Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            '30 km/w',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 15,
                              color:  Colors.white,
                              fontWeight: FontWeight.w200
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height*.07,), const Text(
                            'Weight',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 25,
                              color:  Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            '12.5 kg',
                            style: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.w200,
                              color:  Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: height*.03,),
                          Container(
                            width: width*.3,
                            height: height*.06,
                            decoration:const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)
                              ),
                            ),
                            child: Center(child: Row(children:  [
                              Container(height: height*.05,width: width*.07,
                                decoration:const
                                BoxDecoration(
                                  image:   DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage("assets/btnic.png"),
                                  ),
                                ),
                              ),
                              SizedBox(width: width*.03,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children:const  [
                                  Text(
                                    '50 m',
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color:  Color(0xffff9a08),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'From you',
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color:  Colors.grey,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                          ],),),)
                        ],
                      ),
                    ),
                     SizedBox(width: width*.09),
                    Container(height: height*.45,width: width*.63,
                      decoration:const
                      BoxDecoration(
                        image:   DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/e_scooter.png"),
                        ),
                      ),
                    ),
                  ],),

                ],),
            ),
          ),
          Positioned(
              bottom: 80.0,
              left: width*.15,
              right: width*.15,
              child: Container(width: width*.8,height: height*.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HoplaButton(Color(0xffff9a08),width*.3, height*.07, Color(0xffffffff), 'Lock', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return PathWay();
                        }));
                      }),
                      HoplaButton(Color(0xffff9a08),width*.3, height*.07,  Color(0xffffffff), 'Reselect', (){}),

              ],))),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
