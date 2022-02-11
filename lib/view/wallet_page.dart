import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/component/weather.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/temp.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:hopla_front_mob/widgets/listViewAnimate.dart';
import 'package:line_icons/line_icons.dart';


class WalletPage extends StatefulWidget {



  @override
  State<WalletPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WalletPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late ExpandedTileController _controller;

  void initState() {
    _controller = ExpandedTileController(isExpanded:true);
    super.initState();
  }
  bool eye=false  ;
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return   Scaffold(
      drawerScrimColor: Colors.grey.withOpacity(0.7),
      key: _scaffoldKey,
      backgroundColor: Color(0xffDFE6EF),
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
        width: width*.8,color: Colors.white,),
      body:   ListView(
        children:  [
          Container(
              height: height*.06,
              decoration: BoxDecoration(
                    color:  Colors.white,
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: width*.05,),
                      InkWell(
                        onTap: (){_scaffoldKey.currentState?.openDrawer();},
                        child: const Icon(
                          LineIcons.bars,
                          color: Colors.black87,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: width*.23,),
                      const Text(
                        'Wallet Manager',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color:  Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )

                ),
          SizedBox(height: height*.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height*.06,
                width: width*.9,
                decoration: BoxDecoration(
                  color:  Colors.white,
                ),
                  child:Row(
                    children: [
                      SizedBox(width: width*.05,),
                      const Text(
                        'Balance in Wallet',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color:  Colors.black87,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(width: width*.02,),
                      InkWell(
                        onTap: (){
                          setState(() {
                            eye = !eye;
                          });
                        },
                        child:  Icon(
                          !eye ?LineIcons.eye : LineIcons.eyeSlash,
                          color: Colors.black26,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: width*.19,),
                      eye? const Text(
                        'Mad 380,89',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color:  Colors.black87,
                        ),
                        textAlign: TextAlign.left,
                      ) : SizedBox(),
                    ],
                  )
              ),
            ],
          ),
          StepperPage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height*.18,
                width: width,
                child:ListView7(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BBarH(page: 'w',),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
