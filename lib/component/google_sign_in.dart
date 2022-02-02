import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';

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

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Container(
      child: _isLoggedIn
          ?
      Center(child: SizedBox(
        width:width*.85,height:height*.07,
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
            width:width*.8,height:height*.065,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width*.15,
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
                      fontSize: 14,
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

          : Center(child: SizedBox(child: HoplaButton(Color(0xffffffff),width*.85,height*.07, Colors.white.withOpacity(0.5), "Login",(){
        _googleSignIn.signIn().then((userData) {
          setState(() {
            if(userData!=null){
              _isLoggedIn = true;
              _userObj = userData;
            }
            else {
              _isLoggedIn = false;

            }
            print(userData);


          });
        }).catchError((e) {
          print(e);
        });

      }),),)
      ,
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GoogleSignInAccount>('_userObj', _userObj));
  }
}