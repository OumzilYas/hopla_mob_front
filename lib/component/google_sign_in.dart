import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Sign> {
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj ;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String Name ="";
  String pic ="";
  String mail ="";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter(String name,String email,String pic ) async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
       prefs.setString('name', name);
       prefs.setString('email', email);
       prefs.setString('pic', pic);
       prefs.setBool('login', true);

    });
  }
  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Container(
      child: _isLoggedIn
          ?
      Center(child: SizedBox(
        height: height*.06,
        width: width*.75,
        child:  ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all( Colors.white.withOpacity(0.5),),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side:  const BorderSide(
                  color: Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
          ),
          child: Container(
            height: height*.06,
            width: width*.75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width*.1,
                  child:CircleAvatar(
                    radius: 25,
                    backgroundImage:  NetworkImage(_userObj!.photoUrl.toString()),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_userObj!.displayName.toString(),style: const  TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 17,
                      color:  Colors.white,
                    ),),
                    Text(_userObj!.email,style: const  TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 12,
                      color:  Colors.white,
                    ),),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      _googleSignIn.signOut().then((value) {
                        setState(() {
                          _isLoggedIn = false;
                        });
                      }).catchError((e) {});
                    },
                    icon : Icon(Icons.logout)),

              ],
            ),
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PhonePage();
            }));
          },
        ),
      ),)

       :Center(child: SizedBox(child: Container(
        height: height*.06,
        width: width*.75,
        child: FlatButton(
          onPressed: ()async{
            _googleSignIn.signIn().then((userData) {
              setState(() {
                if(userData!=null){
                  _isLoggedIn = true;
                  _userObj = userData;
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PhonePage();
                  }));
                }
                else {
                  _isLoggedIn = false;

                }
                print(userData);
                _incrementCounter(userData!.displayName.toString(),userData.email.toString(),userData.photoUrl.toString());

              });
            }).catchError((e) {
              print(e);
            });
          },
          color: Colors.grey.shade50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/Google.png",height: 18,width: 18,),
              SizedBox(width: 10,),
              Text("Connect with Google",style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.grey, letterSpacing: .5,fontSize: 14),
              ),),
            ],
          ),
        ),
      ),)));
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GoogleSignInAccount>('_userObj', _userObj));
  }
}