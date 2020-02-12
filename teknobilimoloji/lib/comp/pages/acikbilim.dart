import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:teknobilimoloji/comp/Get/getrss.dart';
import 'package:teknobilimoloji/comp/linkUrl/LinkUrl.dart';


class AcikBilim extends StatefulWidget {
  @override
  _AcikBilimState createState() => _AcikBilimState();
}

class _AcikBilimState extends State<AcikBilim> {

  final SwiperController _swiperController=new SwiperController();

  int _currentindex=0;
  final int _pageCount=3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder(
                future: GetRss(url: AcikBilimUrl).getRss(),
                builder: (context,snapshot){
                      switch(snapshot.connectionState){
                        
                        case ConnectionState.none:
                          // TODO: Handle this case.
                          break;
                        case ConnectionState.waiting:

                          return Center(
                            child: CircularProgressIndicator(),
                          );

                          break;
                        case ConnectionState.active:
                          // TODO: Handle this case.
                          break;
                        case ConnectionState.done:
                         
                         return PageView.builder(
                           itemCount: snapshot.data.length,
                           itemBuilder: (context,index){
                             return Container(
                               height: 50.0,
                               margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                               decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(16),
                                     color: Colors.grey.shade400,
                                   ),
                               child:Column(
                               children:<Widget>[
                                Stack(
                               children: <Widget>[
                                   Container(
                                   child: Material(
                                     elevation: 10.0,
                                     child: Image.network(
                                   snapshot.data[index].icon.toString(),
                                   fit: BoxFit.fill,
                                   ),
                                   ),
                                 ),
                                 Positioned(
                                   top: 10.0,
                                   left: 10.0,
                                   child: Container(
                                     height: 20.0,
                                     width: 20.0,
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(16.0)
                                     ),
                                     child: Image.network('https://yt3.ggpht.com/a/AGF-l7-XN6eHABcoWxkqATMiGD-k1szOnhzlzLqx1Q=s900-c-k-c0xffffffff-no-rj-mo',fit: BoxFit.cover,),
                                   ),
                                 )
                               ],
                             ),
                             SizedBox(height: 40.0,),
                              Container(
                                width: 400.0,
                                child: Center(
                                child: Text(snapshot.data[index].title.toString(),
                                style: TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black
                                ),
                                ),
                                ),
                              ),
                              Divider(height: 1.0,),
                            ],
                            ),
                             );
                           },
                         );
                         break;
                      }
                },
              ),         
            );

   
  }
}
