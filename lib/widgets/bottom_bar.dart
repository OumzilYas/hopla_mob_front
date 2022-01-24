import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';

class BBarH extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  const BBarH({ Key ?key}) : super(key: key);

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
            onTap: (){},
            child: Container(
              height: width*.07,
              width: width*.07,
              decoration:const BoxDecoration(
                image:   DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/home-button.png"),
                ),
              ),),
          ),
          SizedBox(width: width*.25,),
          InkWell(
            onTap: (){},
            child: Container(
              height: width*.07,
              width: width*.07,
              decoration:const BoxDecoration(
                image:   DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/wallet.png"),
                ),
              ),),
          ),
          SizedBox(width: width*.27,),
          InkWell(
            onTap: (){},
            child: Container(
              height: width*.07,
              width: width*.07,
              decoration:const BoxDecoration(
                image:   DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/images.png"),
                ),
              ),),
          ),
          SizedBox(width: width*.07,),

        ],
      ),
      decoration:const BoxDecoration(
        color: Colors.white,
      ),);
  }
}
