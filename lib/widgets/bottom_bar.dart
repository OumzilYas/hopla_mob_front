import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/edit_profile_page.dart';
import 'package:hopla_front_mob/view/home_page.dart';
import 'package:hopla_front_mob/view/phone_page.dart';

class BBarH extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
   BBarH({ Key ?key,required this.page}) : super(key: key);
  String page ;
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return Container(width: 100,height: height*.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: width*.07,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePage2();
              }));
            },
            child: Container(
              height: width*.07,
              width: width*.07,
             child: Icon(FontAwesomeIcons.home,color: page =='h'? Colors.orangeAccent:Colors.grey,size: 26,),),
          ),
          SizedBox(width: width*.25,),
          InkWell(
            onTap: (){},
            child:  Container(
              height: width*.07,
              width: width*.07,
              child: Icon(FontAwesomeIcons.wallet,color: page =='w'? Colors.orangeAccent:Colors.grey,size: 26,),),
          ),
          SizedBox(width: width*.27,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  EditProfilePage();
              }));
            },
            child:  Container(
              height: width*.07,
              width: width*.07,
              child: Icon(Icons.person,color: page =='p'? Colors.orangeAccent:Colors.grey,size: 26,),),
          ),
          SizedBox(width: width*.07,),

        ],
      ),
      decoration:const BoxDecoration(
        color: Colors.transparent,
      ),);
  }
}
