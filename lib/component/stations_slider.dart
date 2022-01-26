import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';
import 'package:hopla_front_mob/view/scooters_page.dart';
import 'package:hopla_front_mob/view/stations_page.dart';



class StationsSlider extends StatelessWidget {
  const StationsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stations = scooterData.map(
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
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HomePage();
              }
              )
              );
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child:  SizedBox(
                      height: 50,
                      width: (50),
                      child:Center(child: Image.asset("assets/icon.png",height: 50,width:50,),),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hopla Cournich',style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                      ),),
                      SizedBox(height: 20,),
                      Text('064646556',style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w300,fontSize: 15),
                      ),),

                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 50,
                        child: Center(child: Row(
                          children: [
                            Icon(Icons.pin_drop,color: Colors.white,size: 20,),
                            SizedBox(width: 7,),
                            Text('3.5 KM',style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w500),
                            ),),                            ],
                        ),),
                        decoration:const  BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                            color: Colors.orangeAccent),
                      ),

                    ],
                  ),
                ],
              ),
            ),

          ),

        )).toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 2.0,
        initialPage: 0,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height*0.12,
      ),
      items: stations,
    );
  }
}

