import 'dart:math';

import 'package:flutter/material.dart';
import 'package:teknobilimoloji/comp/Get/wordpress_data.dart';
import 'package:teknobilimoloji/comp/Get/wordpress_data.dart';
import 'package:teknobilimoloji/comp/animation/baloncuklar.dart';
import 'package:teknobilimoloji/comp/linkUrl/LinkUrl.dart';
import 'package:teknobilimoloji/comp/widget/gercekbilim_widgets/gercekbilim_items.dart';
import 'package:url_launcher/url_launcher.dart';

class GercekBilim extends StatefulWidget {
  @override
  _GercekBilimState createState() => _GercekBilimState();
}

class _GercekBilimState extends State<GercekBilim> {

  String _title;
  String url;

  FixedExtentScrollController fixedExtentScrollController= new FixedExtentScrollController();
  AsyncSnapshot snapshot;
  int index;
  int url_index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.web),
        onPressed: launchURL,
        tooltip: 'Web de Aç',
      ),
      body: FutureBuilder(
        future: GetRssWordPres(url: GercekBilimUrl).getRss(),
        builder: (BuildContext contex,snapshot){
            switch(snapshot.connectionState){

              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                    return Center(
               child: Balon(),
               //child: CircularProgressIndicator(),
             );
                break;
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                // TODO: Handle this case.
                return Stack(children: <Widget>[
                  Container(
                    child: Balon(),
                  ),
                  Container(
                  child: Column(
                    children: <Widget>[     
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          onSelectedItemChanged: (url_index){
                             //URLGelen().setURL(snapshot.data[url_index].link.toString());
                              
                              if(url_index==null){
                                url_index=0;
                                url= snapshot.data[0].link.toString();
                              }else{
                                url= snapshot.data[url_index].link.toString();
                              }

                            print(url);
                          },
                        controller: fixedExtentScrollController,
                        physics: FixedExtentScrollPhysics(),
                        itemExtent:275.0,
                        childDelegate: ListWheelChildLoopingListDelegate(
                          children: List.generate(
                            snapshot.data.length,
                                (i){
                                  return GestureDetector(
                                          child: GercekBilim_Items(
                                          icon: snapshot.data[i].icon.toString(),
                                          title: snapshot.data[i].title.toString(),
                                          index: i,
                                        ),
                                        onTap: (){
                                         setState(() {
                                          
                                         });
                                        },
                                        );
                                },
                            ),
                        ), 
                        ),
                       ),
                      ],
                     ),
                    ),
                 ],
                );
                    break;
                }
            },
          ),
        );
      }

      launchURL() async {

        //  if(url_index==null){
        //    print(url_index);
        //    url= snapshot.data[0].link.toString();
        // }

    setState(() {
        
      });
      
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch ${url}';
      }
      
  }

  }
