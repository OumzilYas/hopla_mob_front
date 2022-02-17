import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/creditCard.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/component/weather.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/cards.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:hopla_front_mob/widgets/listViewAnimate.dart';
import 'package:im_stepper/stepper.dart';
import 'package:line_icons/line_icons.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import 'offers_Statuts_page.dart';


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
  int activeStep = 0; // Initial step set to 5.
  int upperBound = 1;
  List voucher =[false,false,false,false];
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);


    return   Scaffold(
      drawerScrimColor: Colors.grey.withOpacity(0.7),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
        width: width*.8,color: Colors.white,),
      body:   ListView(
        children:  [
          Container(
              height: height*.06,
              decoration: BoxDecoration(
                color:  Color(0xffDFE6EF) ,
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
          IconStepper(
            activeStepBorderColor: Colors.green,
            activeStepColor: Color(0xffDFE6EF).withOpacity(0.3),
            lineColor:Colors.green ,
            stepColor:Color(0xffDFE6EF) ,
            enableNextPreviousButtons: false,
            icons: [
              Icon(LineIcons.donate),
              Icon(LineIcons.moneyBill),
            ],
            activeStep: activeStep,
            onStepReached: (index) {
              setState(() {
                activeStep = index;
              });
            },
          ),
          Row(
            children:  [
              SizedBox(width: width*.07,),
               Text(
                activeStep ==0 ?'Refill Your Wallet :' : 'Payment Methode : ',
                style: const TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color:  Colors.black,
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
          Row(
            children:  [
              SizedBox(width: width*.07,),
               Text(
                activeStep ==0 ?'Please Click on the convenient Voucher \n and Go to payment ':
                 'Choose your payment Methode by Card \n or pay with partners checkout',
                style: const TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 13,
                  fontWeight: FontWeight.w100,
                  color:  Colors.grey,
                ),
                textAlign: TextAlign.left,
              )
            ],
          ),
          SizedBox(height: height*.015,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              activeStep ==0?
              Container(
                  height: height*.43 ,
                  width: width*.92,
                  child:GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (_, index) => Card(
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      elevation: 0,
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            voucher = [false,false,false,false];
                            voucher[index] = true;
                          });
                        },
                        child: Container(
                          height: height*.11,
                          width: width*.4,
                          padding:  EdgeInsets.all(8.0),
                          decoration:  BoxDecoration(
                              color: Color(0xffDFE6EF),
                              border: Border.all(color:voucher[index]? Colors.green: Colors.transparent)
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
                      ),
                      borderOnForeground: false,
                    ),
                    itemCount: voucher.length,
                  )
              ):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height*.33,
                    width: width*.9,
                    child:Center(
                      child: ExpandedTile(
                        theme: const ExpandedTileThemeData(
                          headerColor: Color(0xffDFE6EF),
                          headerSplashColor: Color(0xffDFE6EF),
                          contentBackgroundColor: Color(0xffDFE6EF),
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
                          height: height*.2,
                          child: ListView(
                            children: [
                              Container(
                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10),),
                                    border: Border.all(color:Colors.white)

                                ),
                                height: height*.06,
                                width: width,
                                child: Center(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: width*.01,),
                                    Icon(FontAwesomeIcons.ccVisa),
                                    Text('CIH Bank',style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color:  Colors.black,
                                    ),),
                                    Text('*****8787',style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color:  Colors.black,
                                    ),),
                                    RoundCheckBox(
                                      onTap: (selected) {},
                                      border: Border.all(
                                        width:3,
                                        color: Color(0xffDFE6EF),
                                      ),
                                      uncheckedColor: Colors.white,
                                      checkedColor: Color(0xffDFE6EF),
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
                                    border: Border.all(color:Colors.white)

                                ),
                                height: height*.06,
                                width: width,
                                child: Center(child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(width: width*.01,),
                                    Icon(FontAwesomeIcons.creditCard),
                                    Text('CIH Bank',style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color:  Colors.black,
                                    ),),
                                    Text('*****8787',style:  TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      color:  Colors.black,
                                    ),),
                                    RoundCheckBox(
                                      onTap: (selected) {},
                                      border: Border.all(
                                        width:3,
                                        color: Color(0xffDFE6EF),
                                      ),
                                      uncheckedColor: Colors.white,
                                      checkedColor: Color(0xffDFE6EF),
                                      size: 30,
                                    ),
                                    SizedBox(width: width*.01,),
                                  ],
                                )),
                              ),
                              SizedBox(height: height*.01,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10),),
                                        border: Border.all(color:Colors.white)

                                    ),
                                    height: height*.06,
                                    width: width*.5,
                                    child: Center(child:InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return  MySample();
                                        }));
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(width: width*.01,),
                                          Icon(FontAwesomeIcons.plusCircle),
                                          SizedBox(width: width*.03,),
                                          Text('Use New Pay',style: TextStyle(
                                            fontFamily: 'Product Sans',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w200,
                                            color:  Colors.black,
                                          ),),
                                          SizedBox(width: width*.01,),
                                        ],
                                      ),
                                    )),
                                  ),
                                ],
                              )
                            ],
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Container(
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                            border: Border.all(color:Color(0xffDFE6EF))

                        ),
                        height: height*.06,
                        width: width*.8,
                        child: Center(child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: width*.01,),
                            Icon(FontAwesomeIcons.store),
                            Text('Cash Payment',style:  TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),),
                            RoundCheckBox(
                              onTap: (selected) {},
                              border: Border.all(
                                width:3,
                                color: Color(0xffDFE6EF),
                              ),
                              uncheckedColor: Colors.white,
                              checkedColor: Color(0xffDFE6EF),
                              size: 30,
                            ),
                            SizedBox(width: width*.01,),
                          ],
                        ))),],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: height*.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffDFE6EF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      side:  const BorderSide(
                        color: Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                child:  Center(
                  child:  Text(
                    activeStep ==0  ?'Go To Payment' : 'Checkout',
                    style: const TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 17,
                      color:  Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                onPressed: (){
                  if (activeStep < upperBound) {
                    setState(() {
                      activeStep++;
                    });
                  }
                  else{
                     AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        showCloseIcon: true,
                        title: 'Succes',
                        btnOkText: 'Go to Offers',
                        buttonsTextStyle: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 20,
                          color:  Colors.white,
                        ),
                        btnOkOnPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return  OffersStatus2();
                          }));
                        },
                         body: Container(
                           height: height*.45,
                           width: width,
                           child: ListView(
                               children :  [
                                 Text(
                                   'Well Done ! ',
                                   style:  TextStyle(
                                     fontFamily: 'Product Sans',
                                     fontSize: 20,
                                     color:  Colors.black,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                                 SizedBox(height:height*.02 ,),
                                 Text(
                                   'Your Wallet refill successfully completed ',
                                   style: const TextStyle(
                                     fontFamily: 'Product Sans',
                                     fontSize: 13,
                                     color:  Colors.black,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                                 SizedBox(height:height*.02 ,),
                                 Text(
                                   'Your Invoice ',
                                   style: const TextStyle(
                                     fontFamily: 'Product Sans',
                                     fontSize: 20,
                                     color:  Colors.black,
                                   ),
                                   textAlign: TextAlign.center,
                                 ),
                                 SizedBox(height:height*.02 ,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children:const  [
                                     Text(
                                       'Hopla Company ',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),

                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children:const  [
                                     Text(
                                       'Email : suport@Hopla.ma',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),

                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children:const  [
                                     Text(
                                       'Phone +2128767676 ',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),

                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children:const  [
                                     Text(
                                       'date : 13/13/22',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),

                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children:const  [
                                     Text(
                                       'time : 12:00',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),

                                   ],
                                 ),
                                 SizedBox(height:height*.02 ,),
                                 Container(
                                   height: 1,
                                   width: width,
                                   color: Colors.black,
                                 ),
                                 SizedBox(height:height*.01 ,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children:const  [
                                     Text(
                                       'Vocher V1 ',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),
                                     Text(
                                       '500 Dh ',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),
                                   ],
                                 ),
                                 SizedBox(height:height*.01 ,),
                                 Container(
                                   height: 1,
                                   width: width,
                                   color: Colors.black,
                                 ),
                                 SizedBox(height:height*.03 ,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children:const  [
                                     Text(
                                       'Amount : 500 Dh ',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),

                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children:const  [
                                     Text(
                                       'Rest : 50 Dh ',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),
                                   ],
                                 ),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children:const  [
                                     Text(
                                       'tax :1%',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),
                                   ],
                                 ),
                                 SizedBox(height:height*.02 ,),
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children:const  [
                                     Text(
                                       'www.Hoplamob.ma',
                                       style:  TextStyle(
                                         fontFamily: 'Product Sans',
                                         fontSize: 13,
                                         color:  Colors.black,
                                         decoration: TextDecoration.underline,
                                       ),
                                       textAlign: TextAlign.center,

                                     ),
                                   ],
                                 ),


                               ]
                           ),
                         ),
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: (type) {
                          debugPrint('Dialog Dissmiss from callback $type');
                        })
                      .show();
                  }
                },
              ),
            ],
          ),
          SizedBox(height: height*.007,),
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
  // Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      case 4:
        return 'Publisher Information';

      case 5:
        return 'Reviews';

      case 6:
        return 'Chapters #1';

      default:
        return 'Introduction';
    }
  }
}

