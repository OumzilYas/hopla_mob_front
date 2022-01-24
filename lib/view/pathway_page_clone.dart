import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/component/map.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/view/recap_page.dart';
import 'package:hopla_front_mob/widgets/app_bar.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:hopla_front_mob/widgets/hopla_button.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';



class PathWay2 extends StatefulWidget {



  @override
  State<PathWay2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PathWay2> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();

  void asyncMethod() async {
    _stopWatchTimer.onExecute
        .add(StopWatchExecute.start);
  }
  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  bool isRunning = false;
  void initState() {
    // TODO: implement initState
    asyncMethod();
    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));

    /// Can be set preset time. This case is "00:01.23".
    // _stopWatchTimer.setPresetTime(mSec: 1234);
  }
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);

    return   Scaffold(
      drawerScrimColor: Color(0xffff9a08).withOpacity(0.7),
      key: _scaffoldKey,
      drawer:  Container(child: Drawer(
        child: DrawerComp(),
      ),
        width: width*.8,color: Colors.white,),
      body:   Stack(
        children:  [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(height: height,
              decoration:const
              BoxDecoration(
                color:  Color(0xff7c94b6),
                image:   DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/MAPS2.png"),
                ),
              ),),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBarH((){_scaffoldKey.currentState?.openDrawer();}),),
          Positioned(
            bottom: 90.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              height: height*.3,
              width: width*.8,
              decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              child: Row(
                children: [
                  SizedBox(width: width*.05,),
                  Container(
                      decoration:const  BoxDecoration(
                        color: Color(0xffff9a08),
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                      ),
                      height: height*.27,
                      width: width*.35,
                      child: Column(children: [
                        const SizedBox(height: 2,),
                        Container(height: height*.15,width: width*.33,
                          decoration:const
                          BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/e_scooter.png"),
                            ),
                          ),),
                        const SizedBox(height: 15,),
                        const Text(
                          'Xiomi ',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 25,
                            color:  Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'Battery ',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            color:  Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          '80%',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 15,
                            color:  Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],)
                  ),
                  SizedBox(width: width*.05,),
                  Container(
                      decoration:const  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                      ),
                      height: height*.27,
                      width: width*.45,
                      child: Column(children: [
                        Container(height: height*.13,width: width*.23,
                          decoration:const
                          BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/distance.png"),
                            ),
                          ),),
                        Container(height: height*.065,width: width*.7,
                          child:  Center(
                            child:Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data!;
                                  final displayTime =
                                  StopWatchTimer.getDisplayTime(value, hours: _isHours,milliSecond: false);
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          displayTime,
                                          style: const TextStyle(
                                            fontFamily: 'Product Sans',
                                            fontSize: 20,
                                            color:Color(0xff828282) ,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          decoration:const BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/shadowTimer.png"),
                            ),
                          ),),
                        Container(height: height*.065,width: width*.7,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  child:FloatingActionButton(
                                    backgroundColor: Colors.green,
                                    child:
                                    Icon(Icons.lock),
                                    onPressed: () {
                                      _stopWatchTimer.onExecute
                                          .add(StopWatchExecute.stop);
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return RecapPage();
                                      }));
                                    },
                                  ),
                                ),

                              ],
                            )
                        ),
                      ],)
                  ),

                ],),
            ),
          ),
          Positioned(
            top : 90,
            left: 40.0,
            right: 40.0,
            child:Container(
              decoration:const  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              height: height*.15,
              width: width*.8,
              child: Row(children: [
                Container(
                  child:Center(
                    child: Container(height: height*.1,width: width*.3,
                          decoration:const
                          BoxDecoration(
                            image:   DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/distance38.png"),
                            ),
                          ),),
                  ) ,
                ),
                Container(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text(
                      'Casablanca',
                      style:   TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 17,
                        color:  Color(0xffff9a08),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: height*.05,),
                    Center(child: SizedBox(child: HoplaButton(Color(0xffffffff),width*.42,height*.03, Color(0xffff9a08), "CasaPort",(){

                    }),),),
                  ],) ,
                )
              ],),
            ),),

          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: BBarH()),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
