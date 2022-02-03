import 'package:flutter/material.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';

class ScooterContainer extends StatelessWidget {


  ScooterContainer({ Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
        Positioned(
            right: 5,
            top: 3,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                image:   DecorationImage(
                  fit: BoxFit.contain,
                  image:const AssetImage("assets/stations/4.png"),
                ),
              ),

            )),
        Positioned(
          right: 0,
          child:  Container(
            padding: const EdgeInsets.all(1),
            decoration:  BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints:const  BoxConstraints(
              minWidth: 15,
              minHeight: 15,
            ),
            child: const  Text(
              '4',
              style:  TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w700
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
