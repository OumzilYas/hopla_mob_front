

//import 'package:barcode_scan/barcode_scan.dart';
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
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/dialoge.dart';


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
          const Positioned(
            top : 530,
            left: 0.0,
            right: 0.0,
            child: ScooterSlider(),),

          Positioned(
            bottom: 60.0,
            left: width*.35,
            right: 0.0,
            child: Container(width: 10,height: 50,
            child: Row(
              children: [HoplaField('Select', 'type',() async {
                // await BarcodeScanner.scan();
                showDialog(
                    context: context,
                    builder: (BuildContext context) => const DialogScooter());
              })],))),
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
