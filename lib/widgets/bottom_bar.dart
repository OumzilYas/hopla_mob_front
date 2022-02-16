import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/edit_profile_page.dart';
import 'package:hopla_front_mob/view/home_page.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/view/wallet_page.dart';
import 'package:line_icons/line_icons.dart';

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
             child: Icon(LineIcons.home,color: page =='h'? Colors.orangeAccent:Colors.black,size: 26,),),
          ),
          SizedBox(width: width*.25,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return  WalletPage();
              }));
            },
            child:  Container(
              height: width*.07,
              width: width*.07,
              child: Icon(LineIcons.wallet,color: page =='w'? Colors.orangeAccent:Colors.black,size: 26,),),
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
              child: Icon(LineIcons.user,color: page =='p'? Colors.orangeAccent:Colors.black,size: 26,),),
          ),
          SizedBox(width: width*.07,),

        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xffDFE6EF).withOpacity(0.1),
      ),);
  }
}
