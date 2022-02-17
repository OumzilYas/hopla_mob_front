import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/tripEndPage.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:line_icons/line_icons.dart';
typedef void StringCallback(String val);

class InfoDialoge extends StatefulWidget {


  const InfoDialoge ({ Key ?key}): super(key: key);
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<InfoDialoge> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override

  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    Widget cancelButton = TextButton(
      child: Text("NO",style:TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 15),
      ),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes",style: TextStyle(color: Colors.black, fontFamily: 'Product Sans',letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 15),
      ),
      onPressed:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return TripEndPage();
        }));
      },
    );

    return Form(
        child:  Builder(builder: (BuildContext context) {return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Color(0xffD9E1E7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notice",style : TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 15),
                ),
                Icon(FontAwesomeIcons.ellipsisH)
              ],
            ),
            content: Text("Do you want really to end the trip",style:TextStyle(fontFamily: 'Product Sans',color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w500,fontSize: 15),
            ),

            actions: [
              cancelButton,
              continueButton,
            ],
          );
        });
        })
    );
  }
}

