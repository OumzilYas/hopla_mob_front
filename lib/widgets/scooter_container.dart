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
            right: 3,
            top: 3,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow:const  [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .25), blurRadius: 16.0)
                ],
              ),
              child:const Icon(
                Icons.electric_scooter,
                color: Colors.black,
                size: 28,
              ),
            )),
        Positioned(
          right: 0,
          child:  Container(
            padding: const EdgeInsets.all(1),
            decoration:  BoxDecoration(
              color: Colors.lightGreen,
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
