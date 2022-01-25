
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';

class CreatAccountPage extends StatefulWidget {
  const CreatAccountPage({Key? key}) : super(key: key);


  @override
  State<CreatAccountPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CreatAccountPage> {

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return Scaffold(
      body:  Center(
        child:  Container(
          decoration:
          const  BoxDecoration(
            color:  Color(0xffff9a08),
          ),


          height:SizeConfig.getHeight(context) ,
          width: SizeConfig.getHeight(context) ,
          child: ListView(
            children: [
              SizedBox(height:height*.05 ,),
              Center(
                child:  SizedBox(
                  height: height*.1157,
                  width: width*.25,
                  child:Center(child: Image.asset("assets/iconsbbw.png",height: 200,width: width*.5,),),
                ),
              ),
              SizedBox(height:height*.1 ,),
              Center(
                child:  Container(
                  height: height*.68,
                  width: width*.9,
                  decoration:const  BoxDecoration(
                    color: Colors.transparent,
                    image:   DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/Rect5.png"),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding:  EdgeInsets.all(10),

                    children: [
                      SizedBox(height: height*.02,),
                      Center(
                        child:Container(
                          height: height*.09,
                          width: width*.6,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(children: [
                                const Text(
                                  'E-mail',
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    color:  Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: height*.02,),
                                Container(height: 1,width:width*.25,color: Colors.grey,),
                              ],),
                              Column(children: [
                                const Text(
                                  'SMS',
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    color:  Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: height*.02,),
                                Container(height: 1,width:width*.25,color: Colors.grey,),
                              ],),                            ],
                          ),
                        ) ,
                      ),
                      Container(
                      height: height*.08,
                      width: width*.2,
                      decoration:const  BoxDecoration(
                        color: Colors.transparent,
                        image:   DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/textfbb.png"),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child:   Center(
                        child: Container(
                          height: height*.06,
                          width: width*.7,
                          child: TextField(
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                              ),
                            ),

                          ),
                        ),
                      )
                    ),
                      SizedBox(height: height*.03,),
                      Container(
                          height: height*.08,
                          width: width*.2,
                          decoration:const  BoxDecoration(
                            color: Colors.transparent,
                            image:   DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/textfbb.png"),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child:   Center(
                            child: Container(
                              height: height*.06,
                              width: width*.7,
                              child: TextField(
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'E-mail',
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                                  ),
                                ),

                              ),
                            ),
                          )
                      ),
                      SizedBox(height: height*.03,),
                      Container(
                          height: height*.08,
                          width: width*.2,
                          decoration:const  BoxDecoration(
                            color: Colors.transparent,
                            image:   DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/textfbb.png"),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child:   Center(
                            child: Container(
                              height: height*.06,
                              width: width*.7,
                              child: TextField(
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                                  ),
                                ),

                              ),
                            ),
                          )
                      ),
                      SizedBox(height: height*.03,),
                      Container(
                          height: height*.08,
                          width: width*.2,
                          decoration:const  BoxDecoration(
                            color: Colors.transparent,
                            image:   DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/textfbb.png"),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child:   Center(
                            child: Container(
                              height: height*.06,
                              width: width*.7,
                              child: TextField(
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Confirm password',
                                  hintStyle: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                                  ),
                                ),

                              ),
                            ),
                          )
                      ),
                      Row(children: [
                        SizedBox(width: width*.04,),
                        const Text(
                          'Already have account ?',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 14,
                            color:  Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: width*.04,),
                        const Text(
                          'Sign up!',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 14,
                            color:  Color(0xffff9a08),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],),
                      SizedBox(height: height*.03,),
                      Container(
                          height: height*.06,
                          width: width*.2,
                          child:   Center(
                            child: Container(
                              height: height*.05,
                              width: width*.35,
                              child: HoplaField('Sign up','',(){}),
                            ),
                          )
                      ),
                    ],),
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
