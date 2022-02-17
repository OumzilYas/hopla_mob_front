import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/model/scooter.dart';


typedef void StringCallback(String val);
class StatusSlider extends StatefulWidget {
  const StatusSlider({Key? key, required this.callback}) : super(key: key);
  final StringCallback callback;

  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}
List status = [[false,'Access','assets/Iconsprofil/access.png'],
[false,'Pass','assets/Iconsprofil/pass.png'],[false,'Subscription','assets/Iconsprofil/abon.png']];
int _current = 1;
class _TabControllerPageState extends State<StatusSlider> {

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    final List<Widget> onestatus = status.map(
            (item) => InkWell(
              onTap: (){
                setState(() {
                  for (var i = 0; i < status.length; i++) {
                    status[i][0] = false;
                  }
                });
                setState(() {
                  status[_current][0]  =true;
                });
                widget.callback('Selected');
              },
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.green,
                    border: Border.all(color:item[0]? Color(0xffFFA400): Colors.transparent,width: 3),
                    borderRadius: const BorderRadius.all(
                       Radius.circular(30),

                  ),
                ),
                child: ListView(
                  padding:  EdgeInsets.all(10),
                  children: [
                    Center(
                      child:  Text(item[1],style:TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontSize: height*.04,fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height:height*.007 ,),
                    Center(
                      child:  Container(
                        width: height*.09 ,
                        height: height*.09 ,
                        child:Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(item[2]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    Center(
                      child: Container(
                        height: 1,
                        width: width*.7,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    Center(
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('• Auto-renewable subscriptions on all Hoplaplatforms are eligible.',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),
                          SizedBox(height:height*.01,),
                          Text('• Days of paid service include all subscription offer types (introductory, promotional, and offer codes)',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),
                          SizedBox(height: height*.01,),
                          Text('• Free trials and renewal extensions are excluded from days of paid service.',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),
                          SizedBox(height: height*.01,),
                          Text('• Days of paid service are specific to each subscription group.',textAlign: TextAlign.center,style: GoogleFonts.lato(
                            textStyle: TextStyle(fontFamily: 'Product Sans',color: Colors.white, letterSpacing: .5,fontWeight: FontWeight.w800),
                          ),),

                        ],
                      ),
                    )
                  ],
                ),
              )),
            ).toList();
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.7,
        aspectRatio: 2.0,
        initialPage: 1,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height*.53,
          onPageChanged: (index, _) {
            setState(() {
              _current = index;
            });
          }
      ),
      items: onestatus,

    );
  }
}

