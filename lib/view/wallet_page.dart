import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/component/weather.dart';
import 'package:hopla_front_mob/config/size_config.dart';
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
          SizedBox(height: height*.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: height*.4,
                  width: width*.92,
                  child:GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (_, index) => Card(
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      elevation: 0,
                      child: Container(
                        height: height*.11,
                        width: width*.4,
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color:  Colors.white,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height*.003,),
                            const InkWell(
                              child:  Icon(
                                LineIcons.donate,
                                color: Colors.blueGrey,
                                size: 50,
                              ),
                            ),
                            SizedBox(height: height*.01,),
                             Text(
                              (index+2).toString()+'00 Mad \n Voucher',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 17,
                                fontWeight: FontWeight.w100,
                                color:  Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              '+',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color:  Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              (index+1).toString()+'5 Mad Bonus',
                              style: const TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color:  Colors.green,
                              ),
                              textAlign: TextAlign.left,
                            ),

                          ],
                        ),
                      ),
                      borderOnForeground: false,
                    ),
                    itemCount: 4,
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: height*.18,
                  width: width*.9,
                  child:Center(
                    child: ExpandedTile(
                      theme: const ExpandedTileThemeData(
                        headerColor: Colors.white,
                        headerSplashColor: Colors.white,
                        contentBackgroundColor: Colors.white,
                        headerRadius: 0,
                      ),
                      controller: _controller,
                      title: const Text(
                        'Payment  Method',
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color:  Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      content: Container(
                        color: Colors.white,
                        height: height*.05,
                        child:  Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(LineIcons.plusCircle),
                              SizedBox(width: width*.06,),
                              const Text(
                                'Add Payment  Method',
                                style: TextStyle(
                                  fontFamily: 'Product Sans',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color:  Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        debugPrint("tapped!!");
                      },
                      onLongTap: () {
                        debugPrint("long tapped!!");
                      },
                    ),
                  ),
              ),
            ],
          ),
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
