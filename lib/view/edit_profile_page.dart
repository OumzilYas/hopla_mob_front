import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:pinput/pin_put/pin_put.dart';


class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key ?key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
final List<bool> imgList = [true,false];
int _current = 0;
List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class _MyHomePageState extends State<EditProfilePage> {
  DateTime _date = DateTime(2020, 11, 17);
  bool isSwitched = false;


  var dropdownValue1,dropdownValue2,dropdownValue3;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Color(0xff63A6BE)),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  final List<Widget> stations = ['Profile','Map'].map(
          (item) => Container(
            margin: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                )),
            width: 350,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: [
                SizedBox(height: 10,),
                 Center(
                  child: Text(
                    item.toString()+  ' Stings',
                    style:  TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140,
                      height: 50,
                      child:const TextField(
                        decoration:  InputDecoration(
                            labelText: "First Name",
                            labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff63A6BE)),
                              //  when the TextFormField in focused
                            ) ,
                            border:   UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Color(0xff63A6BE)
                              ),

                            )
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 50,
                      child:const TextField(
                        decoration:  InputDecoration(
                            labelText: "Last Name",
                            labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                            focusedBorder:  UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff63A6BE)),
                              //  when the TextFormField in focused
                            ) ,
                            border:   UnderlineInputBorder(
                              borderSide:  BorderSide(
                                  color: Color(0xff63A6BE)
                              ),

                            )
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  height: 50,
                  child:TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                        labelText: "E-mail",
                        labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                        focusedBorder:const  UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff63A6BE)),
                          //  when the TextFormField in focused
                        ) ,
                        border:const  UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xff63A6BE)
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child:TextField(
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                        labelText: "Phone Number",
                        labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                        focusedBorder:const  UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff63A6BE)),
                          //  when the TextFormField in focused
                        ) ,
                        border: const  UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xff63A6BE)
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child:TextField(
                    keyboardType: TextInputType.streetAddress,
                    decoration:  InputDecoration(
                        labelText: "Street Address",
                        labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                        focusedBorder:const  UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff63A6BE)),
                          //  when the TextFormField in focused
                        ) ,
                        border: const  UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xff63A6BE)
                          ),

                        )
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child:TextField(
                    keyboardType: TextInputType.datetime,
                    decoration:  InputDecoration(
                        labelText: "Birth Date",
                        labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                        focusedBorder:const  UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff63A6BE)),
                          //  when the TextFormField in focused
                        ) ,
                        border: const  UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xff63A6BE)
                          ),

                        )
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child:TextField(
                    obscureText: false,
                    decoration:  InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(icon: Icon(Icons.visibility_off),onPressed: (){

                        },),
                        labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff63A6BE)),
                          //  when the TextFormField in focused
                        ) ,
                        border: const  UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xff63A6BE)
                          ),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  child:TextField(
                    obscureText: false,
                    decoration:  InputDecoration(
                        labelText: "Confirme Password",
                        suffixIcon: IconButton(icon: Icon(Icons.visibility_off),onPressed: (){

                        },),
                        labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff63A6BE)),
                          //  when the TextFormField in focused
                        ) ,
                        border: const  UnderlineInputBorder(
                          borderSide:  BorderSide(
                              color: Color(0xff63A6BE)
                          ),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(child: Container(
                      height:50,
                      width: 200,
                      decoration:const  BoxDecoration(
                        color: Color(0xff42E0BF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child:
                      Center( child : Text('Upload Pictur ',
                          style:   TextStyle(fontFamily: 'Product Sans', color: Colors.white, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                          )),
                    ))
                  ],
                ),

              ],
            ),
          )
         ).toList();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Scaffold(
      drawerScrimColor: const Color(0xffff9a08).withOpacity(0.7),
      key: _scaffoldKey,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
      width: width*.8,color: Colors.white,),
      backgroundColor: Color(0xFFF4F5F9),
      body: Center(
        child: ListView(
            children: <Widget>[
              SizedBox(height:height*.02,),
              Row(children: [
                SizedBox(width:width*.07,),
                InkWell(
                  onTap: (){_scaffoldKey.currentState?.openDrawer();},
                  child : Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color:  Color(0xffDFE6EF),
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: const [
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
                    ),
                    child:const Icon(
                      Icons.menu,
                      color: Colors.black87,
                      size: 28,
                    ),

                  ),),
                SizedBox(width:width*.07,),
                const  Text('Edit Profile ',
                  style:  TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.w800),
                )
                  ],),
              SizedBox(height:height*.02,),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width*.6,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width*.2,
                      child:CircleAvatar(
                        radius: 40,
                        backgroundImage:  AssetImage("assets/profile.jpeg"),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Yassin Oum',
                          style:  TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 24,fontWeight: FontWeight.w800),
                        ),
                        Text('tassin@gmail.com',
                          style:  TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w800),
                        ),
                        Container(
                          width: 220,
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.crown,color: Colors.green,size: 20,),
                              SizedBox( width: 10,),
                              Text('Exprience',style:  TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 18,fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height:height*.02,),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  height: MediaQuery.of(context).size.height*.58,
            ),
            items: stations,
          ),
              SizedBox(height:height*.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(child: Container(
                    height:50,
                    width: 150,
                    decoration:const  BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child:
                    Center( child : Text('Save ',
                      style:   TextStyle(fontFamily: 'Product Sans', color: Colors.white, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w300),
                    )),
                  ))
                ],
              ),

            ]
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
