import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';

final List<Widget> scooters = scooterData.map(
        (item) => Container(
          decoration:const  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
          ),
          child: ListView(
            padding:  EdgeInsets.all(10),
            children: [
              Container(height: 180,width: 150, decoration:const
              BoxDecoration(
                image:   DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/shadow.png"),
                ),
              ),
              child: SizedBox(child:  Container(height: 170,width: 130,
                decoration:const BoxDecoration(
                image:   DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/e_scooter.png"),
                ),
              ),),),),
              Row(children: [
                const SizedBox(width: 10,),
                Container(
                  height: 2,
                  width: 50,
                  color: const Color(0xffff9a08),
                ),
                const SizedBox(width: 5,),
                const Text(
                  'Xiaomi1',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 15,
                    color: const Color(0xff707070),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],),
              const SizedBox(height: 5,),
              Container(
               width: 150,
               child : Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                       Text(
                         'Battery',
                         style: TextStyle(
                           fontFamily: 'Product Sans',
                           fontSize: 15,
                           color:  Color(0xff707070),
                         ),
                         textAlign: TextAlign.center,
                       ),
                       Text(
                         '80%',
                         style: TextStyle(
                           fontFamily: 'Product Sans',
                           fontSize: 9,
                           color:  Color(0xff707070),
                         ),
                         textAlign: TextAlign.center,
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                       Text(
                         'Speed',
                         style: TextStyle(
                           fontFamily: 'Product Sans',
                           fontSize: 15,
                           color:  Color(0xff707070),
                         ),
                         textAlign: TextAlign.center,
                       ),
                       Text(
                         '  20 km/h',
                         style: TextStyle(
                           fontFamily: 'Product Sans',
                           fontSize: 9,
                           color:  Color(0xff707070),
                         ),
                         textAlign: TextAlign.center,
                       ),
                     ],
                   ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: const [
                       Text(
                         'Wight',
                         style: TextStyle(
                           fontFamily: 'Product Sans',
                           fontSize: 15,
                           color:  Color(0xff707070),
                         ),
                         textAlign: TextAlign.center,
                       ),
                       Text(
                         '20Kg',
                         style: TextStyle(
                           fontFamily: 'Product Sans',
                           fontSize: 9,
                           color:  Color(0xff707070),
                         ),
                         textAlign: TextAlign.center,
                       ),
                     ],
                   ),

                 ],),

             ),

            ],
          ),
    )).toList();

class ScooterSlider extends StatelessWidget {
  const ScooterSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
        aspectRatio: 2.0,
        initialPage: 1,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height*0.3,
      ),
      items: scooters,
    );
  }
}

