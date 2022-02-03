import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';

class AppBarH extends StatelessWidget {

  final  press ;
  AppBarH(this.press,{ Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return Container(
      height: height*.14,
      decoration:  BoxDecoration(
        color:  const Color(0xffff9a08).withOpacity(0.65),
        borderRadius:const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
        ),

      ),
      child: Center(
          child:Container(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: width*.05,),
                Container(
                  width: width*.12,
                  height: width*.12,
                  decoration: const  BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: InkWell(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      child:const FaIcon(FontAwesomeIcons.bars,color: Colors.grey,size: 25,),
                      onTap: press,
                    ),),                      ),
                SizedBox(width: width*.05,),
                SizedBox(
                  width: width*.54,
                  height: height*.055,
                  child: Container(
                      decoration:const  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),

                      ),
                      child: Row(
                        children: [
                          IconButton(
                            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                              icon:const FaIcon(FontAwesomeIcons.search,color: Colors.grey,size: 18,),
                              onPressed: () { press;}
                          ),
                          Container(
                            width: width*.4,
                            height: height*.045,
                            child:  TextField(
                              decoration:  InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search locations',
                                hintStyle: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.grey,fontSize: 16),
                                ),
                              ),

                            ),
                          )
                        ],
                      )
                  ),
                ),
                SizedBox(width: width*.02,),
                SizedBox(
                  width: width*.15,
                  child: Center(
                    child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                        icon:const FaIcon(FontAwesomeIcons.slidersH,color: Colors.white,size: 35,),
                        onPressed: () { print("Pressed"); }
                    ),),
                ),
                SizedBox(width: width*.05,)
              ],
            ),
          )
      ),
    );
  }
}
