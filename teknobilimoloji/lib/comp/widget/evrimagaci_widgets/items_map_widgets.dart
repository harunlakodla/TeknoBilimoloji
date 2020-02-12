import 'package:flutter/material.dart';

class Items_Map_Widgets extends StatefulWidget {
  final Map getItemsLink;
  String Items='Son İçerikler';
  final String ItemsLink;
  Items_Map_Widgets({Key key, this.getItemsLink, this.ItemsLink}) : super(key: key);

  @override
  _Items_Map_WidgetsState createState() => _Items_Map_WidgetsState();
}

class _Items_Map_WidgetsState extends State<Items_Map_Widgets> {
  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //           flex: 1,
    //           child: Container(
    //             alignment: Alignment.center,
    //             margin: EdgeInsets.all(10.0),
    //             width: double.infinity,
    //             height: 50.0,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(16.0),
    //               color: Colors.amber,
    //             ),
    //             child: DropdownButton<String>(
    //               value: Items,
    //               onChanged: (String newValue){
    //                 setState(() {
    //                  widget.Items=newValue;
    //                  // ItemsLink=getItemsLink[newValue];
    //                 });
                    
    //                   print(ItemsLink.toString());
    //               },
    //               items: getItems.map<DropdownMenuItem<String>>((String value){
    //                 return DropdownMenuItem(
    //                   value: value,
    //                   child: Text(value),
    //                 );
    //               }).toList(),
    //             ),
    //           )
    //         );
  }
}