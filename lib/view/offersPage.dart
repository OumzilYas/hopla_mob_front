import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/OffersTab.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/payment_page.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';


class OfferPage extends StatefulWidget {
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  String _stringCus = "textt";
  set stringCus(String value) => setState(() => _stringCus = value);
  List offers = [false,false,false,false];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return  Scaffold(
      drawerScrimColor:  Colors.grey.withOpacity(0.7),
      key: _scaffoldKey,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
        width: width*.8,color: Colors.white,),
      body:   Stack(
        children: [
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
            top: 120.0,
            left: 20.0,
            right: 0.0,
            child:Row(
              children:const  [
                Text('Chose Plane : ',style: const TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Positioned(
            top: 120.0,
            child: SizedBox(
              height: height*.7,
              width: width,
              child:TabControllerPage(
                offersList: offers,
                callback: (val) => setState(() => _stringCus = val),
                press: (){

                },
              ),
            ),),
          Positioned(
             bottom: 60.0,
             left: 0,
              right: 0,
              child: offers.indexOf(true)!=-1?Center(child: HoplaButton(Colors.white,width*.7,height*.07,Colors.orangeAccent,'Buy Now',(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  PayPage();
                }));
              },),):const SizedBox(),),

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