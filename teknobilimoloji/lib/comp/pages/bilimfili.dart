import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:teknobilimoloji/comp/Get/getrss.dart';
import 'package:teknobilimoloji/comp/animation/baloncuklar.dart';
import 'package:teknobilimoloji/comp/linkUrl/LinkUrl.dart';


class BilimFili extends StatefulWidget {
  @override
  _BilimFiliState createState() => _BilimFiliState();
}

class _BilimFiliState extends State<BilimFili> {

  final SwiperController _swiperController=new SwiperController();

  int _currentindex=0;
  final int _pageCount=3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: GetRss(url: BilimFiliUrl).getRss(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          switch(snapshot.connectionState){

            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              // TODO: Handle this case.
             return Center(
               child: Balon(),
             );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              return Stack(
                children: <Widget>[
                  Container(
                    child: Balon(),
                    //Arka plana nesne eklemek için gerekli olan container
                  ),
                   Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                        Balon(),
                        PageView.builder(
                          itemCount:snapshot.data.length,
                          itemBuilder: (BuildContext context,int index){
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.all(50.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0)
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: Image.network(snapshot.data[index].icon),
                                  ),
                                  Center(
                                child: Material(
                                  elevation: 1.0,
                                  child: Text(
                                  snapshot.data[index].title.toString(),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontStyle: FontStyle.italic    
                                  ),
                                ),
                                )
                              ),
                                ],
                              ),
                            ),
                            //onTap: ()=>BottomSheets(context: context,title:spanshot.data[index].title.toString(),description: spanshot.data[index].description.toString(),).bottomsheets(),
                            //Navigator.push(context,MaterialPageRoute(builder: (context)=>InformationPage())),
                          );
                          }
                        )
                    ],
                  ),
                    ],
                  );
                  break;
                  }
                 }
                ),
            );

   
  }
}
