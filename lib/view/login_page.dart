
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/google_sign_in.dart';
import 'package:hopla_front_mob/component/swipUp.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/creat_account.dart';
import 'package:hopla_front_mob/view/new_map_page.dart';
import 'package:hopla_front_mob/view/phone_page.dart';


import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final bool title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List temp = ["Login","Create Account"];
  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
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
        Text(label,style: TextStyle(fontFamily: 'Product Sans',color: Colors.white),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    final List<Widget> _views =  [
      Column(
        children: <Widget>[
          SizedBox(height: height*.011,),
          Container(
            height: height*.065,
            width: width*.7,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email ID",
                labelStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 14),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: height*.011,),
          Container(
            height: height*.065,
            width: width*.7,
            child: TextField(
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 14),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.red,
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: height*.011,),
          Align(
            alignment: Alignment.center,
            child: Text("Forgot Password ?",style: GoogleFonts.montserrat(
              textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w200),
            )),
          ),
          SizedBox(height: height*.02,),
          Container(
            height: height*.06,
            width: width*.75,
            child: FlatButton(
              onPressed: ()async{
               // await Share.share("text");
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MapAnimation();
                }));
              },
              padding: EdgeInsets.all(0),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff05b42d),
                      Color(0xff05b42d),
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                  child: Text("Login",style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 14),
                  ),textAlign: TextAlign.center,),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(height: height*.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _button("FaceBook", FontAwesomeIcons.facebookF, Colors.blue),
              SizedBox(width: 20,),
              _button("Google",  FontAwesomeIcons.google, Colors.grey),
            ],
          ),


        ],
      ),

      Column(
        children: [
          SizedBox(height: 16,),
          Sign(),
          SizedBox(height: 16,),
          Container(
            height: height*.06,
            width: width*.75,
            child: FlatButton(
              onPressed: (){},
              color: Colors.indigo.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/facebook.png",height: 18,width: 18,),
                  SizedBox(width: 10,),
                  Text("Connect with Facebook",style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.indigo, letterSpacing: .5,fontSize: 14),
                  ),),
                ],
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            height: height*.06,
            width: width*.75,
            child: FlatButton(
              onPressed: (){
              },
              padding: EdgeInsets.all(0),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff05b42d),
                      Color(0xff05b42d),
                    ],
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.mobile,color: Colors.white,size: 25,),
                      SizedBox(width: 5,),
                      Text("Connect with Number",style: GoogleFonts.montserrat(
                        textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 14),
                      ),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),

        ],
      )

    ];
    return Scaffold(
      body:  Center(
        child:  Container(
          decoration:
          BoxDecoration(
            color: const Color(0xff7c94b6),
            image:   DecorationImage(
              fit: BoxFit.cover,
              colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.7),
                  BlendMode.darken),
              image:const AssetImage("assets/image.jpg"),
            ),
          ),


          height:SizeConfig.getHeight(context) ,
          width: SizeConfig.getHeight(context) ,
          child: ListView(
            children: [
               SizedBox(height:height*.05 ,),
              const Center(
                child:Text(
                  'Welcome !',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 37,
                    color:  Color(0x9cffffff),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
               Center(
                child:  SizedBox(
                  height: height*.1157,
                  width: width*.25,
                  child:Center(child: Image.asset("assets/icon.png",height: 200,width: width*.5,),),
                ),
              ),
              SizedBox(height:height*.08 ,),
              Container(
              height:  height*.58,
              width:  MediaQuery.of(context).size.width,
              child: DefaultTabController(
                length: temp.length,
                child: Container(
                  height:  height*.55,
                  width:  MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(
                          width:  MediaQuery.of(context).size.width,
                          height: height*.08,
                          child: Center(
                            child: TabBar(
                              indicatorWeight: 3,
                              isScrollable: true,
                              indicatorColor: Colors.orangeAccent,
                              tabs: List<Widget>.generate(temp.length, (int index){
                                return  Tab(child : Container(height: 70,child:Center(child:Text(temp[index].toString(),style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.white, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w800),
                                ),))));
                              }),
                            ),
                          )
                      ),
                      Container(
                          height:  height*.5,
                          width:  MediaQuery.of(context).size.width,
                        child: TabBarView(
                            children: _views
                        ),
                      )
                    ],
                  ),
                ),
              )),
              SizedBox(height:height*.039 ,),
               Center(
                child:  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomePage2();
                    }));
                  },
                  child: const Text(
                    'Skip Login >>',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 17,
                      decoration: TextDecoration.underline,
                      color:  Color(0x7dffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
