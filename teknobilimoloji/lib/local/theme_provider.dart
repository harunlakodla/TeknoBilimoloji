import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{

  bool isLightTheme;

  ThemeProvider({Key key,this.isLightTheme});

  // static ThemeProvider _instance=ThemeProvider._privateConstructor();
  // ThemeProvider._privateConstructor();
  // Future<ThemeProvider> getInstance () async {
  //   if(_instance==null){
  //     return ThemeProvider._privateConstructor();
  //   }
  //   SharedPreferences prefs = await  SharedPreferences.getInstance();
  //   if(prefs.getBool("screenTheme") ==null){
  //     prefs.setBool("screenTheme", true);
  //   }
  //   isLightTheme=prefs.getBool("screenTheme") as bool;
  // return _instance;
  // }

      final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: Color(0xFF000000),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black54,
    );

    final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
    );

   Future<bool> setThemeData(bool val) async {
     SharedPreferences prefs = await  SharedPreferences.getInstance();
     
    if (val) { 
      isLightTheme=await prefs.setBool("screenTheme", val);
    } else {
      isLightTheme=await prefs.setBool("screenTheme", val) ;
    }
    notifyListeners();
  }

  ThemeData get getThemeDAta=>isLightTheme? lightTheme:darkTheme;
    
  
}