import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';



class ScooterSlider extends StatelessWidget {
  const ScooterSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(height: 50,width: 40, decoration:const
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
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Battery Life',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color:  Color(0xff707070),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '80 km',
                      style: TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color:  Colors.orangeAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],),

              SizedBox(height: 10,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Container(
                  height: 2,
                  width: 45,
                  color: const Color(0xffff9a08),
                ),
                const SizedBox(width: 5,),
                const Text(
                  'Xiaomi1',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color:  Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(width: 5,),
                Container(
                  height: 2,
                  width: 45,
                  color: const Color(0xffff9a08),
                ),

              ],),
              const SizedBox(height: 10,),
              Container(
                width: 150,
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Max Speed',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color:  Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '  30 km/h',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color:  Colors.orangeAccent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Battery',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color:  Color(0xff707070),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '90%',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color:  Colors.orangeAccent,
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
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.5,
        aspectRatio: 2.0,
        initialPage: 1,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height*0.18,
      ),
      items: scooters,
    );
  }
}

