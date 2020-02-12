import'package:flutter/material.dart';
import 'package:teknobilimoloji/comp/Get/getrss.dart';
import 'package:teknobilimoloji/comp/animation/baloncuklar.dart';
import 'package:teknobilimoloji/comp/linkUrl/LinkUrl.dart';

class KozmikAnafor extends StatefulWidget{

  _KozmikAnafor createState()=>_KozmikAnafor();

}

class _KozmikAnafor extends State<KozmikAnafor>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future: GetRss(url: KozmikAnaforUrl).getRss(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                // TODO: Handle this case.
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:

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
                                    margin: EdgeInsets.only(top:10.0,left:10.0),
                                    width: 30.0,
                                    height: 30.0,
                                    child: Image.network('https://pbs.twimg.com/profile_images/947933658924703744/mc5F3vsh.jpg',fit:BoxFit.fill),
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
        },
      ),
    );
  }

}