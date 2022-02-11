import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/component/googleMap.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/home_page.dart';
import 'package:share/share.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TripEndPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<TripEndPage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightOpen,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: height*.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: height*.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "The Trip Ended",
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height*.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height*.3,
                  width: width*.7,
                  color: Colors.black,

                  child:MapSample(),
                ),
              ],
            ),
            SizedBox(
              height: height*.01,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: height*.13,
                    width: width*.43,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        border: Border.all(color: Colors.blueGrey)
                    ),
                    child:Center(
                      child: Container(
                        height: height*.1,
                        width: width*.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: height*.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(FontAwesomeIcons.stopwatch,color: Colors.blueGrey,),

                                SizedBox(width: width*.01,),
                                Text('31 min',style: TextStyle(fontFamily: 'Product Sans',color: Colors.blueGrey, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: width*.01,),
                              ],
                            ),
                            SizedBox(height: height*.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(FontAwesomeIcons.locationArrow,color: Colors.blueGrey,),
                                SizedBox(width: width*.01,),
                                Text('3 Km',style: TextStyle(fontFamily: 'Product Sans',color: Colors.blueGrey, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: width*.01,),
                              ],
                            ),
                            SizedBox(height: height*.01,)

                          ],
                        ),
                      )
                    )),
                SizedBox(width: width*.03,),
                Container(
                    height: height*.2,
                    width: width*.43,
                    child:Center(
                        child: Container(
                          height: height*.13,
                          width: width*.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(FontAwesomeIcons.mapMarker,color: Colors.green,),
                                  SizedBox(width: width*.01,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Chfinja',style: TextStyle(fontFamily: 'Product Sans',color: Colors.blueGrey, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w600),
                                      ),
                                      Text('16:10',style:TextStyle(fontFamily: 'Product Sans',color: Colors.grey, letterSpacing: .5,fontSize: 12,fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: width*.01,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: width*.03,),
                                  Container(height: height*.04,width: 1,color: Colors.blueGrey,)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(FontAwesomeIcons.mapMarked,color: Colors.redAccent,),
                                  SizedBox(width: width*.01,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Marina',style: TextStyle(fontFamily: 'Product Sans',color: Colors.blueGrey, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w600),
                                      ),
                                      Text('16:41',style:  TextStyle(fontFamily: 'Product Sans',color: Colors.grey, letterSpacing: .5,fontSize: 12,fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: width*.01,),
                                ],
                              ),

                            ],
                          ),
                        )
                    )),

              ],),

            SizedBox(
              height: height*.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: height*.06,
                    width: width*.7,
                    decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25),),
                      color: Colors.orangeAccent,
                    ),
                    child:InkWell(
                      onTap: ()async{
                        await Share.share("text");

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(Icons.share,color: Colors.white,size: 30,),
                          SizedBox(width: width*.03,),
                          Center(
                            child:
                            Text('Share',style: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )
                    )),

              ],
            ),
            SizedBox(
              height: height*.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: height*.06,
                    width: width*.7,
                    decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25),),
                        color: Colors.green,
                    ),
                    child:InkWell(
                      onTap: ()async{
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomePage2();
                        }));
                      },
                      child: Center(
                        child:
                        Text('Great',style: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: 16,fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),

              ],
            )
          ],
        ));
  }

  Widget _button(String label, IconData icon, Color color) {
    return InkWell(
      onTap: ()async{
      await Share.share("text");
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
            decoration:
            BoxDecoration(color: color, shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 8.0,
              )
            ]),
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(label,style: TextStyle(fontFamily: 'Product Sans',),),
        ],
      ),
    );
  }

  Widget _body() {
    return MapSample();
  }
}