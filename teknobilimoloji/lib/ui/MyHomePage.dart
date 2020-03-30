import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:full_screen_menu/full_screen_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknobilimoloji/api/wordpress-data.dart';
import 'package:teknobilimoloji/api/wordpress-model.dart';
import 'package:teknobilimoloji/links/links.dart' as links;
import 'package:teknobilimoloji/local/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:teknobilimoloji/ui/evrim_agaci/evrimagaci.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePAgeState createState() => _MyHomePAgeState();
}

class _MyHomePAgeState extends State<MyHomePage> {

  String url=null;
  bool activity=false;

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      url=links.GercekBilimUrl;
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      primary: false,
       body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(),
            sized: false,
           child: SafeArea(
           child:Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: <Widget>[
              activity==false?Expanded(
                flex: 5,
                child: FutureBuilder(
                  future: GetRssWordPress(url: url).getRss(),
                  builder: (context,AsyncSnapshot  snapshot){
                  
                  switch(snapshot.connectionState){
                    
                    case ConnectionState.none:
                      // TODO: Handle this case.
                      break;
                    case ConnectionState.waiting:
                      // TODO: Handle this case.
                      return Container(child: Center(child: CircularProgressIndicator(),));
                      break;
                    case ConnectionState.active:
                      // TODO: Handle this case.
                      break;
                    case ConnectionState.done:
                      // TODO: Handle this case.
                      
                      return  Container(
                        child: ListView.builder(
                        itemCount: snapshot.data==null?0:snapshot.data.length,
                        //itemExtent: snapshot.data[5].imageUrl==null?100:350,
                        itemBuilder: (context,index){

                        return GestureDetector( 
                          onTap: (){
                            showDialog(context:context,child:WebView(
                                        javascriptMode: JavascriptMode.unrestricted,
                                        initialUrl: snapshot.data[index].url.toString(),
                                        ),);
                             
                          },
                         child:Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          elevation: 10,
                          margin: EdgeInsets.all(ScreenUtil().setHeight(25)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              snapshot.data[index].imageUrl==null?SizedBox():GestureDetector(
                                // FadeInImage.assetNetwork(placeholder: "assets/icon/gercek_bilim.jpeg", image: snapshot.data[index].imageUrl.toString(),fit: BoxFit.cover,)
                                child:Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)
                                ),
                                  child: ClipRRect(
                                    child: FadeInImage.assetNetwork(placeholder: "assets/icon/gercek_bilim.jpeg", image: snapshot.data[index].imageUrl.toString(),fit: BoxFit.cover,),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                )
                              ),
                              Center(child: Padding(child:Text(snapshot.data[index].title.toString()), padding: EdgeInsets.all(15.0),)),
                            ],
                          ),
                          )
                        );
                        //return Center(child: Text(snapshot.data[index].title.toString()));
                        }
                       ),
                      );
                      break;
                   }
                })
                ):Expanded(child:  EvrimAgaci(),flex: 5,),
                Expanded(
                  flex: 1,
                 child: Card(
                   elevation: 15,
                   child: Container(
                   color: Colors.transparent,
                   width: ScreenUtil().setWidth(15),
                   child: ListView(
                     children: <Widget>[
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           getWidget(iconUrl: "assets/icon/gercek_bilim.jpeg",Url: links.GercekBilimUrl),
                           evrimclass(iconUrl: "assets/icon/evrim_agaci.png"),
                           getWidget(iconUrl: "assets/icon/bilimfili.jpg",Url: links.BilimFiliUrl),
                           getWidget(iconUrl: "assets/icon/bilimorg.png",Url: links.BilimOrgUrl),
                           getWidget(iconUrl: "assets/icon/acikbilim.png",Url: links.AcikBilimUrl),
                          
                         ],
                       ),
                       SizedBox(height: ScreenUtil().setHeight(50),),
                       Column(
                         children: <Widget>[
                           settings(iconUrl:"assets/icon/settings.png"),
                           Card(
                             child: Column(
                               children: <Widget>[
                                 Switch(
                                  value: themeProvider.isLightTheme, 
                                  onChanged: (val) {
                                    themeProvider.setThemeData(val);                              
                                }),
                                Text("Theme")
                               ],
                             ),
                           )
                         ],
                       )
                       ],
                     ),
                ),
                 ),
              ),
             ],
           )
      ),
       ),
    );
  }

  Widget getWidget ({String iconUrl,String Url,IconData icons}){

    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(50),),
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 30,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(iconUrl==null?"":iconUrl,fit: BoxFit.contain,)
            ),
          onPressed: (){
            setState(() {
            url=Url;
              //print(activity);
             //activity=activity==false?true:false;
             if(activity!=false){
               activity=false;
             }
            });
          }
          ),
      ],
    );

  }

  Widget settings ({String iconUrl,String Url,IconData icons}){

    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(50),),
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(iconUrl==null?"":iconUrl,fit: BoxFit.contain,)
            ),
          onPressed: (){
            //   FullScreenMenu.show(
            //   context,
            //   items: [
            //     FSMenuItem(
            //       icon: Icon(Icons.settings, color: Colors.white),
            //       text: Text('   '),
            //       //onTap: () => themeProvider
            //     ),
            //     FSMenuItem(
            //       icon: Icon(Icons.wb_sunny, color: Colors.white),
            //       text: Text('  '),
            //     ),
            //   ],
            // );

            Toast.show("Coming Soon.", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          }
          ),
      ],
    );
  }
  
  Widget evrimclass ({String iconUrl,String Url,IconData icons}){

    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil().setHeight(50),),
        FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(iconUrl==null?"":iconUrl,fit: BoxFit.contain,)
            ),
          onPressed: (){
            //return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> new EvrimAgaci()));
         // return Navigator.pushNamed(context, "/evrimagaci");
            setState(() {
            activity=true;   
            });
          }
          ),
      ],
    );
  }


}