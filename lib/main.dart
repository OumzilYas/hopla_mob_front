import 'package:flutter/material.dart';
import 'package:hopla_front_mob/view/home_page.dart';
import 'package:hopla_front_mob/view/login_page.dart';
import 'package:hopla_front_mob/view/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;
  bool l = false ;
  final SharedPreferences prefs = await _prefs;
  l  = (prefs.getBool('login') ?? false) ;
  runApp( MyApp(login:l ,));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key,required this.login}) : super(key: key);
  bool login ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:login? HomePage2():  MyHomePage(title: false,),// HomePage(inProgress: false,dirictions: false,),
    );
  }
}

