
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/HoplaTextField.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhonePage extends StatefulWidget {



  @override
  State<PhonePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PhonePage> {
  String initialCountry = 'US';
  PhoneNumber number = PhoneNumber(isoCode: 'US');

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
                  'Phone number',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 40,
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
                  height: 70,
                  width: 350,
                  child:  Center(
                    child: SizedBox(
                      height: 75,
                      width: 280,
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        initialValue: number,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        formatInput: false,
                        textStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 20),
                        ),
                        keyboardType:const
                        TextInputType.numberWithOptions(signed: true, decimal: true),
                        inputDecoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                  ),),
              ),
              Center(child: SizedBox(
                width: width*.85,
                height: height*.07,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:const  [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 14,
                        color:  Color(0xffffffff),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox()
                  ],
                ),),),
              SizedBox(height:height*.03 ,),
              Center(child: SizedBox(child: HoplaButton(width*.85,height*.07, const  Color(0xffff9a08), "Send Code",(){}),),),
              Center(child: SizedBox(
                width: width*.85,
                height: height*.07,
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const  [
                  Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 14,
                      color:  Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Resend Code!',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 14,
                      color:  Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),),)

            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
