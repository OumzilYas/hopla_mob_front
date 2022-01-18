import 'package:flutter/material.dart';
import 'package:hopla_front_mob/config/size_config.dart';

class HoplaButton extends StatelessWidget {
  final double  width;
  final double  height;
  final Color  color;
  final String  text;
  final Function press ;
  HoplaButton(this.width,this.height ,this.color,this.text,this.press,{ Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height ,
      width: width,
      child:  ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side:  const BorderSide(
                color: Colors.transparent,
                width: 2.0,
              ),
            ),
          ),
        ),
        child:  Text(
          text,
          style: const TextStyle(
            fontFamily: 'Product Sans',
            fontSize: 17,
            color:  Color(0xffffffff),
          ),
          textAlign: TextAlign.left,
        ),
        onPressed: () {
          print(SizeConfig.getHeight(context).toString());
          print(SizeConfig.getWidth(context).toString());

        },
      ),
    );
  }
}
