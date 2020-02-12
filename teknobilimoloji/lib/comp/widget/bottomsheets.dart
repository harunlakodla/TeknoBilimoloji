import 'package:flutter/material.dart';

class BottomSheets extends StatelessWidget {

  final String title;
  final BuildContext context;
  final String description;

  const BottomSheets({Key key, this.title,this.context, this.description}) : super(key: key);


  bottomsheets(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc){
          return Container(
            child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: new Column(
            children: <Widget>[
              Expanded(
                child: Container(
                padding: EdgeInsets.all(32.0),
                child: Align(
                heightFactor: 50.0,
                alignment: Alignment.topCenter,
                child: Text(title,
                style: TextStyle(
                  textBaseline: TextBaseline.alphabetic,
                  fontSize: 18.0
                ),
                ),
              ),
              ),
              ),
             Expanded(
               child: Container(
               padding: EdgeInsets.all(32.0),
               child: Align(
                 heightFactor: 50.0,
                 alignment: Alignment.topCenter,
                 child: Text(
                   description,
                   style: TextStyle(
                     fontSize: 18.0,
                     textBaseline: TextBaseline.alphabetic
                   ),
                 ),
               ),
             ),
             )
            ],
          ),
            ),
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
      
  }
}