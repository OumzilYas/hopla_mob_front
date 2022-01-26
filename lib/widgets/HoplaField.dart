import 'package:flutter/material.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/scooters_page.dart';

class HoplaField extends StatelessWidget {
  final String text;
  final String type;
  final press;

  HoplaField(this.text,this.type ,this.press,{ Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: SizeConfig.getHeight(context)*.045,
        width: SizeConfig.getWidth(context)*.3,
        child:  Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Product Sans',
              fontSize: 15,
              color:  Color(0xffffffff),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        decoration:const  BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xffff9a08),
            ),
            BoxShadow(
              color: Colors.orangeAccent,
              spreadRadius: -12.0,
              blurRadius: 10.0,
            ),
          ],
        ),),
      onTap:
       press
      ,
    );
  }
}
