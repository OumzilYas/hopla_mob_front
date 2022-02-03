import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/view/home_page.dart';
import 'package:hopla_front_mob/view/login_page.dart';
import 'package:hopla_front_mob/view/offersPage.dart';
import 'package:hopla_front_mob/view/offers_Statuts_page.dart';

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
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width*.6,
                child: ListView(
                  padding:  EdgeInsets.only(left: 15,top:   40),
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width*.6,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width*.15,
                            child:CircleAvatar(
                              radius: 40,
                              backgroundImage:  AssetImage("assets/profile.jpeg"),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Yassin Oum',
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  color:  Colors.black,
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
                                              Icon(FontAwesomeIcons.crown,color: Colors.green,size: 20,),
                                              SizedBox( width: 10,),
                                              Text('Exprience',  style: GoogleFonts.montserrat(
                                                fontSize: 18,
                                                color:  Colors.black,
                                              ))
                                            ],
                                          ),
                                        )),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(  height: MediaQuery
                        .of(context)
                        .size
                        .height*.025,),
                    Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return  HomePage2();
                              }));
                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.home,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('Home',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return  OffersStatus2();
                              }));
                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.fileInvoiceDollar,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('Offers',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.mapMarkedAlt,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('trip',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.wallet,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  const Text('Payment',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.shoppingCart,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('Purchase',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.assistiveListeningSystems,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('Assitance',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.biking,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('Actvity',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                        InkWell(
                            onTap: (){

                            },
                            child: Container(padding: const EdgeInsets.only(top: 10),
                              width: 220,
                              child: Row(
                                children: [
                                  SizedBox(width: MediaQuery
                                      .of(context)
                                      .size
                                      .width*.02,),
                                  Icon(FontAwesomeIcons.percent,color: Colors.black,size: 25,),
                                  SizedBox( width: 15,),
                                  Text('PromoCode',  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
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
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return  MyHomePage(title: false);
                                  }));
                                },
                                  child: Container(padding: const EdgeInsets.only(top: 10),
                                    width: 220,
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.signOutAlt,color: Colors.green,size: 20,),
                                        SizedBox( width: 15,),
                                        Text('Log Out',  style: TextStyle(
                                          fontFamily: 'Product Sans',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color:  Colors.green,
                                        ))
                                      ],
                                    ),
                                  )),
                            )),
                      ],
                    ),
                ],),
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