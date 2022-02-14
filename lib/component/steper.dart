// Copyright 2020 J-P Nurmi <jpnurmi@gmail.com>
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:line_icons/line_icons.dart';
import 'package:roundcheckbox/roundcheckbox.dart';


class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;
  late ExpandedTileController _controller;

  void initState() {
    _controller = ExpandedTileController(isExpanded:true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    CupertinoStepper _buildStepper(StepperType type) {
      final canCancel = currentStep > 0;
      final canContinue = currentStep < 1;
      return CupertinoStepper(
        type: type,
        currentStep: currentStep,
        onStepTapped: (step) => setState(() => currentStep = step),
        onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
        onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
        steps: [
          for (var i = 0; i <= 2; ++i)
            _buildStep(
              i: i,
              width: width,
              height: height,
              title:i==0?Text('Refile ') :  Text('Payment'),
              isActive: i == currentStep,
              state: i == currentStep
                  ? StepState.editing
                  : i < currentStep ? StepState.complete : StepState.indexed,
            ),
        ],
      );
    }

    return CupertinoPageScaffold(
      child: Container(
        height: height*.56,
        width: width,
        color: Color(0xffDFE6EF),
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return _buildStepper(StepperType.vertical);
              case Orientation.landscape:
                return _buildStepper(StepperType.horizontal);
              default:
                throw UnimplementedError(orientation.toString());
            }
          },
        ),
      ),
    );
  }


  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
    double height = 300,
    double width = 300,
    int i =0

  }) {
    return Step(
      title: title,
      subtitle: i==0 ?Text('Choose your Vocher') :Text('Choose your Payment Methods')  ,
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: width,
        maxHeight: height*.5,
        child:i==0 ? Container(child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height*.35,
              width: width*.6,
              child:GridView.count(
                  padding: EdgeInsets.zero ,// set padding to zero
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio : 0.85,
                  children: List.generate(4, (index) {
                    return Card(
                      color: Colors.transparent,
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color:  Colors.white,
                        ),
                        child: Column(
                          children: [
                            const InkWell(
                              child:  Icon(
                                LineIcons.donate,
                                color: Colors.blueGrey,
                                size: 30,
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              (index+2).toString()+'00 Mad \n Voucher',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                color:  Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              '+',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                color:  Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              (index+1).toString()+'5 Mad Bonus',
                              style: const TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 10,
                                fontWeight: FontWeight.w200,
                                color:  Colors.green,
                              ),
                              textAlign: TextAlign.left,
                            ),

                          ],
                        ),
                      ),
                      borderOnForeground: false,
                    );
                  }
                  )),
            ),
          ],
        ),):
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height*.3,
              width: width*.6,
              child:Center(
                child: ExpandedTile(
                  theme: const ExpandedTileThemeData(
                    headerColor: Colors.white,
                    headerSplashColor: Colors.white,
                    contentBackgroundColor: Colors.white,
                    headerRadius: 0,
                  ),
                  controller: _controller,
                  title: const Text(
                    'Payment  Method',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                      color:  Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  content: Container(
                    color: Colors.white,
                    height: height*.18,
                    child:  Center(
                        child: ListView(
                          children: [
                            Container(
                              height: height*.06,
                              width: width,
                              child: Center(child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: width*.01,),
                                  Icon(FontAwesomeIcons.ccVisa),
                                  Text('****7687',style: GoogleFonts.lato(
                                    textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w900),
                                  ),),
                                  RoundCheckBox(
                                    onTap: (selected) {},
                                    border: Border.all(
                                      width:3,
                                      color: Colors.orangeAccent,
                                    ),
                                    uncheckedColor: Colors.white,
                                    checkedColor: Colors.orangeAccent,
                                    size: 30,
                                    isChecked: true,
                                  ),
                                  SizedBox(width: width*.01,),
                                ],
                              )),
                            ),
                            Container(
                              height: height*.06,
                              width: width,
                              child: Center(child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: width*.01,),
                                  Icon(FontAwesomeIcons.ccMastercard),
                                  Text('****7687',style: GoogleFonts.lato(
                                    textStyle: const TextStyle(color: Colors.black, letterSpacing: .5,fontSize: 15,fontWeight: FontWeight.w900),
                                  ),),
                                  RoundCheckBox(
                                    onTap: (selected) {},
                                    border: Border.all(
                                      width:3,
                                      color: Colors.orangeAccent,
                                    ),
                                    uncheckedColor: Colors.white,
                                    checkedColor: Colors.orangeAccent,
                                    size: 30,
                                    isChecked: false,
                                  ),
                                  SizedBox(width: width*.01,),
                                ],
                              )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration:  BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10),),
                                      border: Border.all(color:Colors.blueGrey)

                                  ),
                                  height: height*.04,
                                  width: width*.2,
                                  child: Center(child:Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(LineIcons.plusCircle),
                                      SizedBox(width: width*.03,),
                                      const Text(
                                        'Add',
                                        style: TextStyle(
                                          fontFamily: 'Product Sans',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w200,
                                          color:  Colors.black,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ),
                  ),
                  onTap: () {
                    debugPrint("tapped!!");
                  },
                  onLongTap: () {
                    debugPrint("long tapped!!");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}