
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/creat_account.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/view/test.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';

import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final bool title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
              image:const AssetImage("assets/image.jpg"),
            ),
          ),


          height:SizeConfig.getHeight(context) ,
          width: SizeConfig.getHeight(context) ,
          child: ListView(
            children: [
               SizedBox(height:height*.05 ,),
              const Center(
                child:Text(
                  'Welcome !',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 37,
                    color:  Color(0x9cffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
               Center(
                child:  SizedBox(
                  height: height*.1157,
                  width: width*.25,
                  child:Center(child: Image.asset("assets/icon.png",height: 200,width: width*.5,),),
                ),
              ),
              SizedBox(height:height*.4 ,),
              Center(child: SizedBox(child: HoplaButton(Color(0xffffffff),width*.85,height*.07, Colors.white.withOpacity(0.5), "Login",(){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return PhonePage();
                }));

              }),),),

              SizedBox(height:height*.035 ,),
              Center(child: SizedBox(child: HoplaButton(Color(0xffffffff), width*.85,height*.07, const  Color(0xffff9a08), "Create account",
                      (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CreatAccountPage();
                        }));
                      }),),),
              SizedBox(height:height*.036 ,),
               Center(
                child:  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomePage2();
                    }));
                  },
                  child: const Text(
                    'Skip Login',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      color:  Color(0x7dffffff),
                    ),
                    textAlign: TextAlign.left,
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
