import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/pathway_page.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
typedef void StringCallback(String val);

class DialogScooter extends StatefulWidget {


  const DialogScooter ({ Key ?key}): super(key: key);
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<DialogScooter> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Form(
        child:  Builder(builder: (BuildContext context) {return StatefulBuilder(builder: (context, setState) {
          return  AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.all(0.0),
            content: Container(
                height: height*.54,
                width:  MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(FontAwesomeIcons.timesCircle,color: Colors.white,size: 20,),
                          )
                        ],
                      ),
                      SizedBox(height: height*.02,),
                      Container(
                        height: height*.3,
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
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: height*.25,
                                  width: width*.33,
                                  decoration:const  BoxDecoration(
                                    image:   DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/e_scooter.png"),
                                    ),//DecprationImage
                                    //Border.all

                                    borderRadius:  BorderRadius.all(Radius.circular(10.0),),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ],
                                  ), //BoxDecoration
                                ), //Conta                      SizedBox(height: height*.02,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Xiomi S1',style: GoogleFonts.lato(
                                      textStyle: TextStyle(color: Colors.orangeAccent, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 20),
                                    ),),
                                    Text('Xiomi Elctric Scooter Pro2',style: GoogleFonts.lato(
                                      textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 10),
                                    ),),
                                    SizedBox(height: 20,),
                                    Container(
                                      height: height*.2,
                                      width: width*.35,
                                      decoration:const  BoxDecoration(//Border.all
                                        borderRadius:  BorderRadius.all(Radius.circular(10.0),),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: const Offset(
                                              5.0,
                                              5.0,
                                            ),
                                            blurRadius: 10.0,
                                            spreadRadius: 2.0,
                                          ), //BoxShadow
                                          BoxShadow(
                                            color: Colors.white,
                                            offset: const Offset(0.0, 0.0),
                                            blurRadius: 0.0,
                                            spreadRadius: 0.0,
                                          ), //BoxShadow
                                        ],
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Text('Battery',style: GoogleFonts.lato(
                                              textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 18),
                                            ),),
                                            Text('120w',style: GoogleFonts.lato(
                                              textStyle: TextStyle(color: Color(0xff00B72B), letterSpacing: .5,fontWeight: FontWeight.w300,fontSize: 16),
                                            ),),
                                            SizedBox(height:height*.02,),
                                            Text('Speed',style: GoogleFonts.lato(
                                              textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 18),
                                            ),),
                                            Text('30 km/h',style: GoogleFonts.lato(
                                              textStyle: TextStyle(color: Color(0xff00B72B), letterSpacing: .5,fontWeight: FontWeight.w300,fontSize: 16),
                                            ),),
                                            SizedBox(height:height*.02,),
                                            Text('Weight',style: GoogleFonts.lato(
                                              textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontWeight: FontWeight.w800,fontSize: 18),
                                            ),),
                                            Text('13 Kg',style: GoogleFonts.lato(
                                              textStyle: TextStyle(color: Color(0xff00B72B), letterSpacing: .5,fontWeight: FontWeight.w300,fontSize: 16),
                                            ),),

                                          ],
                                        ),
                                      ),//BoxDecoration
                                    ), //Conta                      SizedBox(height: height*.02,),

                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),

                      ),
                      SizedBox(height: height*.02,),
                      HoplaButton(Colors.white, width, height*.06, Colors.orangeAccent, 'Unlock', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return PathWay();
                        }));
                      }),
                      SizedBox(height: height*.02,),
                      HoplaButton(Colors.white, width, height*.06, Color(0xff00B72B), 'select another', (){})

                    ],
                  ),
                )),
          );
        });
        })
    );
  }
}

