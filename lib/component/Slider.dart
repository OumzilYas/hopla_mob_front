import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/model/scooter.dart';


typedef void StringCallback(String val);
class StatusSlider extends StatefulWidget {
  const StatusSlider({Key? key, required this.callback}) : super(key: key);
  final StringCallback callback;

  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}
List status = [false,false,false];
int _current = 1;
class _TabControllerPageState extends State<StatusSlider> {

  @override
  Widget build(BuildContext context) {
    final List<Widget> onestatus = status.map(
            (item) => InkWell(
              onTap: (){
                setState(() {
                  for (var i = 0; i < status.length; i++) {
                    status[i] = false;
                  }
                });
                setState(() {
                  status[_current]  =true;
                });
                widget.callback('Selected');
              },
              child: Container(
                decoration:  BoxDecoration(
                  color: Color(0xffFFA400),
                    border: Border.all(color:item? Colors.green: Colors.transparent),
                    borderRadius: const BorderRadius.all(
                       Radius.circular(30),

                  ),
                ),
                child: ListView(
                  padding:  EdgeInsets.all(10),
                  children: [
                    Center(
                      child:  Text('Pass',style: GoogleFonts.lato(
                        textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
                      )),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child:  Container(
                        width: 100,
                        height: 100,
                        child:Center(
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white,
                              child:
                              Icon(Icons.electric_scooter_outlined,color:  Colors.green,size: 50,),
                              onPressed: () {

                              },
                            ),
                          ),
                        ),
                        decoration:const  BoxDecoration(
                          shape: BoxShape.circle,
                          color:  Colors.green,),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        height: 1,
                        width: 270,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('• Auto-renewable subscriptions on all Hoplaplatforms are eligible.',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),
                          SizedBox(height: 10,),
                          Text('• Days of paid service include all subscription offer types (introductory, promotional, and offer codes)',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),
                          SizedBox(height: 10,),
                          Text('• Free trials and renewal extensions are excluded from days of paid service.',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),
                          SizedBox(height: 10,),
                          Text('• Days of paid service are specific to each subscription group.',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),

                        ],
                      ),
                    )
                  ],
                ),
              )),
            ).toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        aspectRatio: 2.0,
        initialPage: 1,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height*.53,
          onPageChanged: (index, _) {
            setState(() {
              _current = index;
            });
          }
      ),
      items: onestatus,

    );
  }
}

