import 'package:flutter/material.dart';

class Object extends StatelessWidget {
  final String title;
  final int index; 
  final String icon;
  Object({this.index,this.title,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 50.0,
        margin: const EdgeInsets.all(50.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
           color: Colors.blue[100 * ((index % 5) + 1)],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child:  Align(
              alignment: Alignment.topLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(icon),
              ),
            ),
            ),
            Expanded(
              flex: 4,
              child: Container(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(title)
              ],
             ),
             ),
            ),
          ],
        ),
    );
  }
}
