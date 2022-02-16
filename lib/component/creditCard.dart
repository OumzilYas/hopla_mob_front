import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:hopla_front_mob/component/drawer.dart';
import 'package:hopla_front_mob/config/size_config.dart';
import 'package:hopla_front_mob/widgets/bottom_bar.dart';
import 'package:line_icons/line_icons.dart';


class MySample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySampleState();
  }
}

class MySampleState extends State<MySample> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.getHeight(context);
    double width = SizeConfig.getWidth(context);
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawerScrimColor: Colors.grey.withOpacity(0.7),
        key: _scaffoldKey,
        drawer:  Container(child: Drawer(
          child: DrawerComp(),
        ),
          width: width*.8,color: Colors.white,),
        backgroundColor: Color(0xFFF4F5F9),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                Container(
                    height: height*.06,
                    decoration: BoxDecoration(
                      color:  Color(0xffDFE6EF) ,
                    ),
                    child:Row(
                      children: [
                        SizedBox(width: width*.05,),
                        InkWell(
                          onTap: (){_scaffoldKey.currentState?.openDrawer();},
                          child: const Icon(
                            LineIcons.bars,
                            color: Colors.black87,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: width*.23,),
                        const Text(
                          'Wallet Manager',
                          style: TextStyle(
                            fontFamily: 'Product Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color:  Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )

                ),
                 SizedBox(
                  height: height*.03,
                ),
                Row(
                  children:  [
                    SizedBox(width: width*.07,),
                    const Text(
                      'Add New Credit Card: ',
                      style: const TextStyle(
                        fontFamily: 'Product Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w200,
                        color:  Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
                SizedBox(
                  height: height*.03,
                ),
                CreditCardWidget(
                  glassmorphismConfig:
                  useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.red,
                  backgroundImage: 'assets/mob.jpg' ,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: Colors.black,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            labelStyle: TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            labelStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            labelStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            labelStyle: const TextStyle(
                              fontFamily: 'Product Sans',
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              color:  Colors.black,
                            ),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            primary: const Color(0xff1b447b),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color:  Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:  BBarH(page: 'p',),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}