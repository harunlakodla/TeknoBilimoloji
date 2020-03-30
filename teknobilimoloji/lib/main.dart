import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknobilimoloji/local/theme_provider.dart';
import 'package:teknobilimoloji/ui/MyHomePage.dart';
import 'package:teknobilimoloji/ui/evrim_agaci/evrimagaci.dart';
Future<void> main() async  { 
  
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await  SharedPreferences.getInstance();
    if(prefs.getBool("screenTheme") ==null){
      prefs.setBool("screenTheme", true);
    }
   
  runApp (
  ChangeNotifierProvider(
  create:(_)=> ThemeProvider(isLightTheme:  prefs.getBool("screenTheme") as bool),
  child: MyApp(),
  )
);
}


class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  FirebaseAnalytics analytics = FirebaseAnalytics();
  FirebaseMessaging _firebaseMessaging =FirebaseMessaging();

  @override
  void initState() { 
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //_showItemDialog(message);
      },
      //onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //_navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //_navigateToItemDetail(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound:true,badge: true,alert: true));
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'TeknoBilimoloji',
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getThemeDAta,
      routes: {
        "/evrimagaci":(context)=>EvrimAgaci()
      },
      home: MyHomePage(),
    );
  }
}
