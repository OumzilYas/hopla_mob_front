import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';
import 'package:hopla_front_mob/view/scooters_page.dart';
import 'package:hopla_front_mob/view/stations_page.dart';



class HomeSlider extends StatelessWidget {
  const HomeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stations = scooterData.map(
            (item) => Container(
          decoration:const  BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
          ),
          child: InkWell(
            onTap: (){
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    child:Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          child:
                          Icon(Icons.electric_scooter_outlined,color: Colors.deepOrangeAccent,size: 25,),
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                    decoration:const  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepOrangeAccent),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('Mad',style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.orange, letterSpacing: .5,fontWeight: FontWeight.w800),
                      ),),
                      Text('20/',style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                      ),),
                      Text('heur',style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w300),
                      ),),
                    ],
                  )
                ],
              ),
            ),

          ),

        )).toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        initialPage: 0,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height*0.2,
      ),
      items: stations,
    );
  }
}

