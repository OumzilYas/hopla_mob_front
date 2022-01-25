
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/phone_page.dart';
import 'package:hopla_front_mob/widgets/HoplaField.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);



  @override
  State<OffersPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OffersPage> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
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
      body:Container(
          decoration:
          const BoxDecoration(
            color:  Color(0xffff9a08),
          ),


          height:SizeConfig.getHeight(context) ,
          width: SizeConfig.getHeight(context) ,
          child: ListView(
            padding:  const EdgeInsets.only(top: 7),
            children: [
              AppBarH((){_scaffoldKey.currentState?.openDrawer();}),
              Container(
                height: height*.7,
                width: width*.8,
                child:CarouselSlider(
                  items:['','',''].map((item) => Container(
                    decoration:const  BoxDecoration(
                      color: Colors.white,
                      image:   DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/offer.png"),
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(30),
                      ),
                    ),

                  )).toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    aspectRatio: 2.0,
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height*0.7,
                    onPageChanged: (index , _){
                      setState(() {
                        _current = index;
                      });
                    }
                  ),),
              ),
              SizedBox(height: height*.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(
                  ["1","2","3"],
                      (index, url) {
                    return Container(
                      width: MediaQuery.of(context).size.height*0.0095,
                      height:MediaQuery.of(context).size.height*0.0095,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.white
                              : Colors.grey ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
