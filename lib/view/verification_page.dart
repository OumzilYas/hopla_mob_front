

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pinput/pin_put/pin_put.dart';


class VerificationPage extends StatefulWidget {



  @override
  State<VerificationPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<VerificationPage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.grey.withOpacity(.5),
      border: Border.all(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return Scaffold(
      body:  Center(
        child:  Container(
          decoration:
          BoxDecoration(
            color: const Color(0xff7c94b6),
            image:   DecorationImage(
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.7),
                  BlendMode.darken),
              image:const AssetImage("assets/scooter_bg.jpg"),
            ),
          ),


          height:SizeConfig.getHeight(context) ,
          width: SizeConfig.getHeight(context) ,
          child: ListView(
            children: [
              SizedBox(height:height*.111 ,),
              const Center(
                child:Text(
                  'SMS',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 40,
                    letterSpacing: 5,
                    color:  Color(0xffffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:height*.025 ,),
              const Center(
                child:Text(
                  'Sing up with your phone number',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 13,
                    color:  Color(0xa1ffffff),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height:height*.055 ,),
              Center(
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
                  height: height*.35,
                  width: width*.8,
                    child: SizedBox(
                      height: height*.35,
                      width: height*.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children:  [
                          SizedBox(height: height*.03,),
                          SizedBox(
                              height: height*.03,
                            child:  const Text(
                              'Enter code',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color:  Color(0xffff9a08),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: height*.16,
                            child:Container(
                              height: height*.11,
                              width: width*.6,
                              color: Colors.white,
                              margin: const EdgeInsets.all(20.0),
                              padding: const EdgeInsets.all(20.0),
                              child: PinPut(
                                fieldsCount: 4,
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                textStyle: const TextStyle(
                                  fontFamily: 'Product Sans',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color:  Colors.grey,
                                ),
                                submittedFieldDecoration: _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                selectedFieldDecoration: _pinPutDecoration,
                                followingFieldDecoration: _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey.withOpacity(.5),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: height*.22,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:const  [
                                SizedBox(),
                                Text(
                                  'Resend Code!',
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 14,
                                    color:  Color(0xffff9a08),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),),
                          const SizedBox(height: 20,),
                          HoplaField('Continue', '',()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const HomePage(inProgress: false,dirictions: false,);
                          }
                          )
                          );
                          })
                        ],
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
