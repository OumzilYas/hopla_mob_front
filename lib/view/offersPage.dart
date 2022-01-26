import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/OffersTab.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
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
      drawerScrimColor: const Color(0xffff9a08).withOpacity(0.7),
      key: _scaffoldKey,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
        width: width*.8,color: Colors.white,),
      body:   ListView(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width:   30,),
              InkWell(
                onTap: (){Navigator.pop(context);},
                child: const Icon(Icons.arrow_back_ios,color: Colors.deepOrangeAccent,size: 30,),
              ),
              const SizedBox(width: 10,),
              Text('Chose a Plan',style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
              ),)
            ],
          ),
          SizedBox(height: height*.04,),
          SizedBox(
            height: height*.645,
            width: width*.95,
            child:TabControllerPage(
              offersList: offers,
              callback: (val) => setState(() => _stringCus = val),
              press: (){

              },
            ),
          ),
          SizedBox(height: height*.04,),
          offers.indexOf(true)!=-1?Center(child: HoplaButton(Colors.white,width*.7,height*.07,Colors.orangeAccent,'Buy Now',(){},),):const SizedBox(),

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}