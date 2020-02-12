import 'dart:async';

import 'package:flutter/material.dart';
import './comp/Main.dart';
import 'comp/animation/bubbles.dart';
import 'comp/mainactivity.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  List<Widget> _list=[Bubbles(),Main()];

  Widget sayfagecis(){
      Timer.periodic(Duration(seconds:3),(timer){
        int time=int.parse(timer.toString());
        switch(time){
          case 0:
            return Bubbles();
          break;
          case 3:
          return Main();
          break;
        }
      });
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Flutter Demo',
      routes: {
      // '/':(context)=>Bubbles(),
       // '/bilimfili':(context)=>BilimFili(),
       '/':(context)=>Main(),
      }
    );
  }
}
