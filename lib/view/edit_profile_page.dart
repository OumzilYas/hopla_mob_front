import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key ?key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
final ImagePicker _picker = ImagePicker();

final List<bool> imgList = [true,false];
_getFromGallery() async {
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

}

class _MyHomePageState extends State<EditProfilePage> {
  DateTime _date = DateTime(2020, 11, 17);
  bool isSwitched = false;

  String name ='';
  String email ='';
  String pic ='';

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> getProfile() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name = (prefs.getString('name') ?? "") ;
      email = (prefs.getString('email') ?? "") ;
      pic = (prefs.getString('pic') ?? "") ;
      print(name+email+pic);
    });

  }
  @override
  void initState() {
    getProfile();
    super.initState();

  }
  bool disable = false;
  var dropdownValue1,dropdownValue2,dropdownValue3;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Color(0xff63A6BE)),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    final List<Widget> stations = ['Profile','App'].map(
            (item) => Container(
              margin: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  )),
              width: width*.9,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  SizedBox(height: height*.01,),
                  Center(
                    child: Container(
                      width: width*.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            item.toString()+  ' Stings',
                            style:  TextStyle(fontFamily: 'Product Sans', color: Colors.black, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                          InkWell(
                            child:Icon(LineIcons.edit,size: 30,color: disable ? Colors.grey : Colors.green,),
                            onTap: (){
                              setState(() {
                                disable=!disable;
                              });
                            },
                          )
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: height*.03,),
                  Container(
                      width: width*.9,
                      height: height*.12,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: <Widget>[
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width*.2,
                                child:CircleAvatar(
                                  radius: 40,
                                  backgroundImage:  NetworkImage(pic),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child:  Container(
                                  width: width*.09,
                                  height:width*.09,
                                  padding: const EdgeInsets.all(1),
                                  decoration:  BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: InkWell(
                                      child: Icon(LineIcons.camera,),
                                      onTap: (){
                                        if(disable){
                                          _getFromGallery();
                                        }
                                          },
                                    ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: width*.48,
                                height: height*.06,
                                child: TextField(
                                  decoration:  InputDecoration(
                                    enabled: disable,
                                      labelText:  name.toString(),
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
                                width: width*.48,
                                height: height*.06,
                                child: TextField(
                                  enabled: disable,
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

                            ],
                          )
                        ],
                      )
                  ),

                  Container(
                    width: width*.9,
                    height: height*.06,
                    child:TextField(
                      enabled: disable,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                          labelText: email,
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
                    width: width*.9,
                    height: height*.06,
                    child:TextField(
                      enabled: disable,
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        prefixIcon: Icon(LineIcons.crown,size: 25,color: Colors.green,),
                          labelText: 'Exprience',
                          labelStyle:   TextStyle(fontFamily: 'Product Sans', color: Colors.grey, letterSpacing: .5,fontSize: 14,fontWeight: FontWeight.w900),
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
                    width: width*.9,
                    height: height*.06,
                    child:TextField(
                      enabled: disable,
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
                    width: width*.9,
                    height: height*.06,
                    child:TextField(
                      enabled: disable,

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
                    width: width*.9,
                    height: height*.06,
                    child:TextField(
                      enabled: disable,
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
                    width: width*.9,
                    height: height*.06,
                    child:TextField(
                      enabled: disable,
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

                ],
              ),
            )
    ).toList();

    return Scaffold(
      drawerScrimColor: Colors.grey.withOpacity(0.7),
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
              SizedBox(height:height*.05,),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  height: MediaQuery.of(context).size.height*.65,
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
      ),
      bottomNavigationBar:  BBarH(page: 'p',),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
