import 'package:flutter/material.dart';
import 'package:teknobilimoloji/comp/Get/getrss.dart';
import 'package:teknobilimoloji/comp/animation/baloncuklar.dart';
import 'package:teknobilimoloji/comp/linkUrl/LinkUrl.dart';



class BilimOrg extends StatefulWidget{
  @override
  _BilimOrg createState()=>_BilimOrg();

}
//url: 'https://www.bilim.org/feed/'
class _BilimOrg extends State<BilimOrg>{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
        future:GetRss(url: BilimOrgUrl).getRss(),
        builder: (BuildContext context,AsyncSnapshot spanshot){
            switch(spanshot.connectionState){
              
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                // TODO: Handle this case.
                return Balon();
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:

                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                        Balon(),
                        PageView.builder(
                          itemCount:spanshot.data.length,
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
                                    child: Image.network(spanshot.data[index].icon),
                                  ),
                                  Center(
                                child: Material(
                                  elevation: 1.0,
                                  child: Text(
                                  spanshot.data[index].title.toString(),
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
                  );
                break;
            }
        },
      ),
    );
  }

}

