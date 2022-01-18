import 'package:flutter/material.dart';
import 'package:hopla_front_mob/config/size_config.dart';

class HoplaField extends StatelessWidget {
  final String text;
  final String type;

  HoplaField(this.text,this.type ,{ Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.getHeight(context)/4,
      width: SizeConfig.getWidth(context)/3,
      child:const  Text(""),
      decoration:const  BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
          ),
          BoxShadow(
            color:  Colors.white,
            spreadRadius: 1.0,
            blurRadius: 12.0,
          ),
        ],
      ),);
  }
}
