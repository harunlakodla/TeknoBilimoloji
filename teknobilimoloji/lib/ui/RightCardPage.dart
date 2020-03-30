import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teknobilimoloji/links/links.dart';

class RightCardPage extends StatefulWidget {

  bool activity;
  String url;
  RightCardPage({Key key,this.activity,this.url}) : super(key: key);

  @override
  _RightCardPageState createState() => _RightCardPageState();
}

class _RightCardPageState extends State<RightCardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Card(
                 elevation: 15,
                 child: Container(
                 color: Colors.transparent,
                 width: ScreenUtil().setWidth(150),
                 child: ListView(
                   children: <Widget>[
                     
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         getWidget(iconUrl: "https://pbs.twimg.com/profile_images/528202476147576834/HMfej3gB_400x400.jpeg",Url: GercekBilimUrl),
                         evrimclass(iconUrl: "https://upload.wikimedia.org/wikipedia/tr/e/e3/Evrim_A%C4%9Fac%C4%B1_K%C4%B1rm%C4%B1z%C4%B1-Beyaz_Logosu.png"),
                         getWidget(iconUrl: "https://yt3.ggpht.com/a/AGF-l7-Asm8U23oIyFei-9J20u4JWK_eb1lF5zQBng=s900-c-k-c0xffffffff-no-rj-mo",Url: BilimFiliUrl),
                         getWidget(iconUrl: "https://www.bilim.org/wp-content/uploads/bilimorg-site-logo.png",Url: BilimOrgUrl),
                         getWidget(iconUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsfVpXy5lS0kgBoa3BXgmQhI0KwcC2yEFangT2TM8mO10Jx9zD&s",Url: AcikBilimUrl),
                        
                       ],
                     ),
                     SizedBox(height: ScreenUtil().setHeight(50),),
                     Column(
                       children: <Widget>[
                         settings(iconUrl:"https://cdn.pixabay.com/photo/2015/12/22/04/00/edit-1103599_960_720.png")
                       ],
                     )
                     
                     ],
                   ),
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
            child: Image.network(iconUrl==null?"":iconUrl,fit: BoxFit.contain,)
            ),
          onPressed: (){
            setState(() {
            widget.url=Url;
              //print(activity);
             //activity=activity==false?true:false;
             if(widget.activity!=false){
               widget.activity=false;
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
            child: Image.network(iconUrl==null?"":iconUrl,fit: BoxFit.contain,)
            ),
          onPressed: (){
            //return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> new EvrimAgaci()));
         // return Navigator.pushNamed(context, "/evrimagaci");
            setState(() {
            //activity=true;   
            });
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
            child: Image.network(iconUrl==null?"":iconUrl,fit: BoxFit.contain,)
            ),
          onPressed: (){
            //return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> new EvrimAgaci()));
         // return Navigator.pushNamed(context, "/evrimagaci");
            setState(() {
            widget.activity=true;   
            });
          }
          ),
      ],
    );
  }
}