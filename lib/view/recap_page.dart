
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';

class RecapPage extends StatefulWidget {
  @override
  State<RecapPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RecapPage> {

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return Scaffold(
      body:  Center(
        child:  Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image:   DecorationImage(
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.7),
                  BlendMode.darken),
              image:const AssetImage("assets/recapbb.png"),
            ),
          ),
          height:SizeConfig.getHeight(context) ,
          width: SizeConfig.getHeight(context) ,
          child: ListView(
            children: [

              SizedBox(height:height*.1 ,),
              const Center(
                child:Text(
                  'Your trip ',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color:  Color(0x9cffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height:height*.041 ,),
              Center(
                child:  Container(
                  height: height*.257,
                  width: width*.7,
                  decoration:const BoxDecoration(
                    image:   DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/mapRecap.png"),
                    ),
                  ),
                ),
              ),
              Center(
                child:  Container(
                  height: height*.157,
                  width: width*.7,
                  decoration:const BoxDecoration(
                    image:   DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/backgroundRecap.png"),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '0hours   10min  15sec',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color:  Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child:Text(
                  'Congrat !',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 27,
                    color:  Color(0x9cffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height:height*.027 ,),
              const Center(
                child:Text(
                  '10 Km ',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 15,
                    color:  Color(0x9cffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height:height*.047 ,),
              const Center(
                child:Text(
                  'Shar On  ',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 25,
                    color:  Color(0x9cffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height:height*.017 ,),
              Center(
                child:  Container(
                  height: height*.08,
                  width: width*.6,
                  child: Row(
                    children: [
                      Container(
                        height: height*.04,
                        width: width*.2,
                        decoration:const BoxDecoration(
                          image:   DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/facebook.png"),
                          ),
                        ),
                      ),
                      Container(
                        height: height*.04,
                        width: width*.2,
                        decoration:const BoxDecoration(
                          image:   DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/whatsapp.png"),
                          ),
                        ),
                      ),
                      Container(
                        height: height*.04,
                        width: width*.2,
                        decoration:const BoxDecoration(
                          image:   DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/instagram.png"),
                          ),
                        ),
                      ),

                    ],
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
