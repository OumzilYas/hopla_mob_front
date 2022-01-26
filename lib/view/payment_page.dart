import 'package:accordion/accordion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/OffersTab.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
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
              Text('Payment Methods',style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
              ),)
            ],
          ),
          SizedBox(height: height*.04,),
          Accordion(
            maxOpenSections: 3,
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
                content: Text('_loremIpsum'),
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
                    )],
                ),

                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
              ),
              AccordionSection(
                isOpen: false,
                header:Container(
                  height: height*.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Google Payment',style: GoogleFonts.lato(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 18,fontWeight: FontWeight.w800),
                      ),),
                      Text('1 account ',style: GoogleFonts.lato(
                        textStyle: const TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w600),
                      ),)
                    ],
                  ),
                ),
                content: Text('_loremIpsum'),
                contentHorizontalPadding: 20,
                contentBorderWidth: 1,
              ),

            ],
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}