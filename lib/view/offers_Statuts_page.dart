

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
import 'package:hopla_front_mob/view/offersPage.dart';
import 'package:hopla_front_mob/view/test.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/dialoge.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';


class OffersStatus2 extends StatefulWidget {



  @override
  State<OffersStatus2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OffersStatus2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String _stringCus = "textt";
  set stringCus(String value) => setState(() => _stringCus = value);
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return   Scaffold(
      drawerScrimColor:  Colors.grey.withOpacity(0.7),
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
            top: 130.0,
            left: 20.0,
            right: 0.0,
            child:Row(
              children:const  [
                Text('Chose Status : ',style: const TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
                ),
              ],
            ),
              ),
          Positioned(
            top : 160,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: height*.6,
              child:  StatusSlider(
                callback: (val) => setState(() => _stringCus = val),
              ),
            ),),
          Positioned(
              bottom: 110.0,
              left: width*.07,
              right: width*.07,
              child: _stringCus =="Selected"?Container(width: 10,height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoplaButton(Colors.white, width*.7, height*.1, Colors.green, 'Next', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return  OfferPage();
                        }));
                      }),

                    ],)):SizedBox()),
           Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: BBarH(page: 'o',)),

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
