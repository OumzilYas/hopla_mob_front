import 'package:flutter/material.dart';
import 'package:hopla_front_mob/view/login_page.dart';
import 'package:hopla_front_mob/view/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: false,),// HomePage(inProgress: false,dirictions: false,),
    );
  }
}

