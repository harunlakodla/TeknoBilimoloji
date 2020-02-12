import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:teknobilimoloji/comp/Get/getrss.dart';
import 'package:teknobilimoloji/comp/animation/baloncuklar.dart';
import 'package:teknobilimoloji/comp/pages/acikbilim.dart';
import 'package:teknobilimoloji/comp/pages/evrimagaci.dart';

import 'bilimfili.dart';
import 'gercekbilim.dart';


class TeknoBilimoloji extends StatefulWidget {
  @override
  _TeknoBilimoloji createState() => _TeknoBilimoloji();
}

class _TeknoBilimoloji extends State<TeknoBilimoloji> {

  int _selected=0;

  List<Widget> _body=[GercekBilim(),EvrimAgaci()];
  List sayfalar=['Gerçek Bilim','Evrim Ağacı'];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Balon(),
          ),
          Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(flex: 20,child:_body[_selected]),
                    Expanded(  
                      flex: 10,
                      child:GestureDetector(
                        onTap :() {
                          setState(() {
                            _selected=_selected;
                          });
                        },
                         child:Container(child: CircleListScrollView.useDelegate(
                      physics: CircleFixedExtentScrollPhysics(),
                      axis: Axis.horizontal,
                      radius: MediaQuery.of(context).size.width*0.6,
                      
                      itemExtent: 75.0,
                        onSelectedItemChanged: (index){
                            _selected=index;
                            print(_selected.toString());
                            
                        },
                       childDelegate: CircleListChildLoopingListDelegate(
                        children:  List.generate(
                      sayfalar.length,
                      (i)=>Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 250,
                                    padding: EdgeInsets.all(5),
                                    color: Colors.blue[100 * ((i % 5) + 1)],
                                    child: Center(
                                      child:Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Image.network(Noticia().getIcon().toString()),
                                            ),
                                            )
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(sayfalar[i]),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    ),
                    ),
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
     );
  }
}