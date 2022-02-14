import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/tripEndPage.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
typedef void StringCallback(String val);

class DialogScooter extends StatefulWidget {

  final Function  press;

  const DialogScooter ({ Key ?key,required this.press}): super(key: key);
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogScooter> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  var  points = <LatLng>[];

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Form(
        child:  Builder(builder: (BuildContext context) {return StatefulBuilder(builder: (context, setState) {
          return  AlertDialog(
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
                height: height*.35,
                width:  MediaQuery.of(context).size.width,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 30,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      InkWell(
                        onTap: (){
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Chfinja Station",
                              style: GoogleFonts.lato(
                                textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w900,fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height*.03,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon( Icons.electric_scooter, color: Colors.green,size: 30,),
                              Text(
                                "Xiomi 1",
                                style: GoogleFonts.lato(
                                  textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon( Icons.battery_full_rounded, color: Colors.green,size: 30,),
                                  Text(
                                    "80%",
                                    style: GoogleFonts.lato(
                                      textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "90 Km",
                                style: GoogleFonts.lato(
                                  textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon( Icons.electric_scooter, color: Colors.green,size: 30,),
                              Text(
                                "Xiomi 1",
                                style: GoogleFonts.lato(
                                  textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon( Icons.battery_full_rounded, color: Colors.green,size: 30,),
                                  Text(
                                    "80%",
                                    style: GoogleFonts.lato(
                                      textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "90 Km",
                                style: GoogleFonts.lato(
                                  textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon( Icons.electric_scooter, color: Colors.green,size: 30,),
                              Text(
                                "Xiomi 1",
                                style: GoogleFonts.lato(
                                  textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon( Icons.battery_full_rounded, color: Colors.green,size: 30,),
                                  Text(
                                    "80%",
                                    style: GoogleFonts.lato(
                                      textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "90 Km",
                                style: GoogleFonts.lato(
                                  textStyle:const  TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w700,fontSize: 20),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(
                        height: height*.03,
                      ),
                      InkWell(
                          onTap:(){
                            print('ttt');
                            widget.press;
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return HomePage(inProgress: true,dirictions: false,);
                            }));                          },
                          child:  Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: height*.06,
                                  width: width*.6,
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10),),
                                      border: Border.all(color: Colors.lightGreen)
                                  ),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: width*.01,),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width*.1,
                                        child:CircleAvatar(
                                          radius: 20,
                                          backgroundImage:  AssetImage("assets/scan.png"),
                                        ),
                                      ),                                      Text('Scan Qr Code',style: GoogleFonts.lato(
                                        textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w600),
                                      ),),
                                      SizedBox(width: width*.01,),
                                    ],
                                  )),

                            ],)
                      )
                    ],
                  ),
                )),
          );
        });
        })
    );
  }
}

