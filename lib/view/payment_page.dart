import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/OffersTab.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:roundcheckbox/roundcheckbox.dart';


class PayPage extends StatefulWidget {
  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _value = false;
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
            right: 20.0,
            child: SizedBox(),
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
                Text('Chose Plane : ',style: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150.0,
            left: 10,
            child: SizedBox(
              height: height*.68,
              width: width*.95,
              child:Accordion(
                maxOpenSections: 1,
                headerBackgroundColor: Colors.orangeAccent.withOpacity(0.7),
                flipRightIconIfOpen: true,
                rightIcon: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                contentBackgroundColor: Colors.white,
                contentBorderColor: Colors.orangeAccent.withOpacity(0.7),
                headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: [
                  AccordionSection(
                    isOpen: false,
                    header:Container(
                      height: height*.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hopla-Wallet',style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 18,fontWeight: FontWeight.w800),
                          ),),
                          Text('Balance 590 Mad',style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w600),
                          ),)
                        ],
                      ),
                    ),
                    content:Column(
                      children: [
                        Container(
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              border: Border.all(color:Color(0xffFFA400))

                          ),
                          height: height*.06,
                          width: width,
                          child: Center(child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: width*.01,),
                              Icon(FontAwesomeIcons.wallet),
                              Text('Use Balance',style: GoogleFonts.lato(
                                textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w500),
                              ),),
                              Text('590 mad',style: GoogleFonts.lato(
                                textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w900),
                              ),),
                              RoundCheckBox(
                                onTap: (selected) {},
                                border: Border.all(
                                  width:3,
                                  color: Colors.orangeAccent,
                                ),
                                uncheckedColor: Colors.white,
                                checkedColor: Colors.orangeAccent,
                                size: 30,
                              ),
                              SizedBox(width: width*.01,),
                            ],
                          )),
                        ),

                      ],
                    ),
                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                  ),
                  AccordionSection(
                    isOpen: true,
                    header:Container(
                      height: height*.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Credit Card',style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 18,fontWeight: FontWeight.w800),
                          ),),
                          Text('2 Cards ',style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w600),
                          ),)
                        ],
                      ),
                    ),
                    content:Container(
                      height: height*.18,
                      child: ListView(
                        children: [
                          Container(
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10),),
                                border: Border.all(color:Color(0xffFFA400))

                            ),
                            height: height*.06,
                            width: width,
                            child: Center(child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: width*.01,),
                                Icon(FontAwesomeIcons.creditCard),
                                Text('CIH Bank',style: GoogleFonts.lato(
                                  textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w500),
                                ),),
                                Text('*****8787',style: GoogleFonts.lato(
                                  textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w900),
                                ),),
                                RoundCheckBox(
                                  onTap: (selected) {},
                                  border: Border.all(
                                    width:3,
                                    color: Colors.orangeAccent,
                                  ),
                                  uncheckedColor: Colors.white,
                                  checkedColor: Colors.orangeAccent,
                                  size: 30,
                                ),
                                SizedBox(width: width*.01,),
                              ],
                            )),
                          ),
                          SizedBox(height: height*.01,),
                          Container(
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10),),
                                border: Border.all(color:Color(0xffFFA400))

                            ),
                            height: height*.06,
                            width: width,
                            child: Center(child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: width*.01,),
                                Icon(FontAwesomeIcons.ccVisa),
                                Text('BP Bank',style: GoogleFonts.lato(
                                  textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w500),
                                ),),
                                Text('*****8997',style: GoogleFonts.lato(
                                  textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w900),
                                ),),
                                RoundCheckBox(
                                  onTap: (selected) {},
                                  border: Border.all(
                                    width:3,
                                    color: Colors.orangeAccent,
                                  ),
                                  uncheckedColor: Colors.white,
                                  checkedColor: Colors.orangeAccent,
                                  size: 30,
                                  isChecked: true,
                                ),
                                SizedBox(width: width*.01,),
                              ],
                            )),
                          ),
                          SizedBox(height: height*.01,),
                          Container(
                            decoration:  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                            ),
                            height: height*.06,
                            width: width*.5,
                            child: Center(child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: width*.01,),
                                Icon(FontAwesomeIcons.plusCircle),
                                Text('Use New Pay',style: GoogleFonts.lato(
                                  textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w500),
                                ),),
                                SizedBox(width: width*.01,),
                              ],
                            )),
                          ),

                        ],
                      ),
                    ),

                    contentHorizontalPadding: 20,
                    contentBorderWidth: 1,
                  ),
                ],
              ),
            ),),
          Positioned(
              bottom: 150.0,
              left: 20,
              child:Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration:  BoxDecoration(
                        color:   Colors.orangeAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        border: Border.all(color: Color(0xffFFA400))

                    ),
                    height:height*.15,
                    width: width*.9,
                    child: Center(child: Container(
                      height:height*.15,
                      width: width*.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text('100',style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 50),
                                  ),),
                                  Column(
                                    children: [
                                      SizedBox(height: height*.03,),
                                      Text('Mad',style: GoogleFonts.lato(
                                        textStyle: TextStyle(color: Colors.orange, letterSpacing: .5,fontWeight: FontWeight.w800),
                                      ),),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          ),
                          SizedBox(width: width*.03,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.checkCircle , color: Colors.green,),
                                  SizedBox(width: 10,),
                                  Text('Pass Status',style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 20),
                                  ),),
                                ],
                              ),
                              SizedBox(height: height*.01,),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.checkCircle , color: Colors.green,),
                                  SizedBox(width: 10,),
                                  Text('Recharge Offer',style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 20),
                                  ),),
                                ],
                              ),
                              SizedBox(height: height*.01,),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.checkCircle , color: Colors.green,),
                                  SizedBox(width: 10,),
                                  Text('20 h/ 30 days',style: GoogleFonts.lato(
                                    textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 20),
                                  ),),
                                ],
                              ),


                            ],
                          )
                        ],
                      ),
                    ),),
                  ),

                ],),
          ),

          Positioned(
              bottom: 90.0,
              left: 50,
              right: 50,
              child: Container(width: 10,height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HoplaButton(Colors.white, width*.7, height*.1, Colors.green, 'Checkout', (){

                      }),

                    ],))),
           Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: BBarH(page: 'py',)),


        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}