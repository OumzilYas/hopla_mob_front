import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/view/offersPage.dart';
import 'package:hopla_front_mob/view/offersTest.dart';

class DrawerComp extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DrawerComp> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListView(

            // Important: Remove any padding from the ListView.
      padding:  EdgeInsets.all(0),
            children: <Widget>[
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height*.3,
                width: 300,
                decoration: const BoxDecoration(
                    color: Color(0xffff9a08),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80.0),
                      //topRight: Radius.circular(80.0),
                    )),
                child: ListView(
                  padding:  EdgeInsets.only(left: 30,top:   0),
                  children: [
                  SizedBox(width: 60,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(  height: MediaQuery
                          .of(context)
                          .size
                          .height*.08,),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:  AssetImage("assets/profile.jpeg"),
                      ),

                      SizedBox(height: 5,),
                      Text('Yassin Oum',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                        ),),
                      InkWell(
                          onTap: (){

                          },
                          child: Container(padding: const EdgeInsets.only(top: 10),
                            width: 220,
                            child: InkWell(

                                child: Container(padding: const EdgeInsets.only(top: 10),
                                  width: 220,
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.crown,color: Colors.deepOrange,size: 20,),
                                      SizedBox( width: 10,),
                                      Text('Exprience',  style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color:  Colors.white,
                                      ))
                                    ],
                                  ),
                                )),
                          )),
                    ],
                  )
                ],),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height:  MediaQuery.of(context).size.height*.7,
                width: 300  ,
                child: ListView(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const OffersPage();
                            }));
                          },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.fileInvoiceDollar,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('Offers',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.mapMarker,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('trips',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.wallet,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('Wallet',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.shoppingBag,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('Achat',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return  TabControllerPage();
                              }));
                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.assistiveListeningSystems,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('Assistance',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.angleDoubleUp,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('Activity',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.percent,color:const Color(0xffff9a08).withOpacity(0.5),size: 20,),
                                  SizedBox( width: 15,),
                                  Text('PromoCode',  style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: const Color(0xff241332),
                                  ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    SizedBox(  height: MediaQuery.of(context).size.height*.05,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery
                            .of(context)
                            .size
                            .width*.09,),
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: InkWell(

                                  child: Container(padding: const EdgeInsets.only(top: 10),
                                    width: 220,
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.signOutAlt,color:const Color(0xffff9a08),size: 20,),
                                        SizedBox( width: 15,),
                                        Text('Log Out',  style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          color: const Color(0xffff9a08),
                                        ))
                                      ],
                                    ),
                                  )),
                            )),
                      ],
                    ),
                  ],
                ),
              ),


            ],
          );



  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}