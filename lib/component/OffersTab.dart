import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
typedef void StringCallback(String val);

class TabControllerPage extends StatefulWidget {
  const TabControllerPage({Key? key, required this.press,required this.offersList,required this.callback}) : super(key: key);
  final  press;
  final  offersList;
  final StringCallback callback;

  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  String _stringCus = "0";
  set stringCus(String value) => setState(() => _stringCus = value);
  @override
  Widget build(BuildContext context) {
    List temp = ["Experience","Recharge"];

      final List<Widget> _views =  [
        ListView.builder(
          padding: const EdgeInsets.all(15),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: InkWell(
                onTap: (){
                  setState(() {
                    for (var i = 0; i < widget.offersList.length; i++) {
                      widget.offersList[i] = false;
                    }
                    widget.offersList[index] = true;

                  });
                  widget.callback('Selected');
                },
                child: Container(
                  decoration:  BoxDecoration(
                      color:   Colors.orangeAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      border: Border.all(color:widget.offersList[index]? Color(0xffFFA400): Colors.transparent)

                  ),
                  height: 150,
                  width: 330,
                  child: Center(child: Container(
                    height:130,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              child:Center(
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    child:
                                    Icon(Icons.electric_scooter_outlined,color: Colors.deepOrangeAccent,size: 25,),
                                    onPressed: () {

                                    },
                                  ),
                                ),
                              ),
                              decoration:const  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrangeAccent),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Mad',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.orange, letterSpacing: .5,fontWeight: FontWeight.w800),
                                ),),
                                Text('20/',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                                ),),
                                Text('heur',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w300),
                                ),),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 100,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('• 5 minutes on a trip',style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                            ),),
                            SizedBox(height: 10,),
                            Text('• 2 minutes added to rest',style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                            ),),
                            SizedBox(height: 10,),
                            Text('• lock option on the trip',style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                            ),),

                          ],
                        )
                      ],
                    ),
                  ),),
                ),
              ),
            );
          },
          itemCount: 4,
        ),
        ListView.builder(
          padding: const EdgeInsets.all(15),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: InkWell(
                onTap: (){
                  setState(() {
                    for (var i = 0; i < widget.offersList.length; i++) {
                      widget.offersList[i] = false;
                    }
                    widget.offersList[index] = true;

                  });
                  widget.callback('Selected');
                },
                child: Container(
                  decoration:  BoxDecoration(
                      color:   Colors.orangeAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      border: Border.all(color:widget.offersList[index]? Color(0xffFFA400): Colors.transparent)

                  ),
                  height: 150,
                  width: 330,
                  child: Center(child: Container(
                    height:130,
                    width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              child:Center(
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    child:
                                    Icon(Icons.electric_scooter_outlined,color: Colors.deepOrangeAccent,size: 25,),
                                    onPressed: () {

                                    },
                                  ),
                                ),
                              ),
                              decoration:const  BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.deepOrangeAccent),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text('Mad',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.orange, letterSpacing: .5,fontWeight: FontWeight.w800),
                                ),),
                                Text('20/',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                                ),),
                                Text('heur',style: GoogleFonts.lato(
                                  textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w300),
                                ),),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 100,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('• expire in 30 Days',style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                            ),),
                            SizedBox(height: 10,),
                            Text('• 3 minute added',style: GoogleFonts.lato(
                              textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontWeight: FontWeight.w800),
                            ),),
                            SizedBox(height: 10,),


                          ],
                        )
                      ],
                    ),
                  ),),
                ),
              ),
            );
          },
          itemCount: 4,
        ),

      ];
    return Container(
        height:  MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height/2.25),
        width:  MediaQuery.of(context).size.width,
        child: DefaultTabController(
          length: temp.length,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                  child: Center(
                    child: TabBar(
                      indicatorWeight: 3,
                      isScrollable: true,
                      indicatorColor: Colors.orangeAccent,
                      tabs: List<Widget>.generate(temp.length, (int index){
                        return  Tab(child : Container(height: 70,child:Center(child:Text(temp[index].toString(),style: GoogleFonts.lato(
                        textStyle: TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 20,fontWeight: FontWeight.w800),
                        ),))));
                      }),
                    ),
                  )
              ),
            ),
            body:  TabBarView(
              children: _views
            ),
          ),
        ));
  }
}

