import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:teknobilimoloji/ui/evrim_agaci/items_maps/evrimagaci_categori_items.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:teknobilimoloji/api/wordpress-data.dart';

class EvrimAgaci extends StatefulWidget {
  @override
  _EvrimAgaciState createState() => _EvrimAgaciState();
}

class _EvrimAgaciState extends State<EvrimAgaci> {

  List<String> getItems=GetEvrimAgaciCategroiItems().getItems();
  Map getItemsLink=GetEvrimAgaciCategroiItems().getItemsLink();
  String Items='Son İçerikler';
  String ItemsLink='';
  List<String> link=new List<String>();
  var sayfa=0;
  var links;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ItemsLink=getItemsLink[Items];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.amber,
              ),
              child: Wrap(
                direction: Axis.vertical,
                runSpacing: 5.0,
                spacing: 5.0,
                children: <Widget>[
                  DropdownButton<String>(
                      focusColor: Colors.red,
                      elevation: 10,
                      value: Items,
                      disabledHint: Center(),
                      onChanged: (String newValue){
                        setState(() {
                        Items=newValue;
                          ItemsLink=getItemsLink[newValue];
                        });
                          print(ItemsLink.toString());
                      },
                      items: /*getItems.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),*/
                      List.generate(getItems.length, (index){
                        return DropdownMenuItem(child: Center(child: Text(getItems[index].toString()),),value: getItems[index].toString(),);
                      }),
                    ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: FutureBuilder(
              future: GetRssWordPress(url: ItemsLink.toString()).getRss(),
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
                      
                       return ListView.builder(
                         itemCount: snapshot.data.length,
                         itemBuilder: (context,index){
                           link.add(snapshot.data[index].url.toString());
                           return GestureDetector(
                                onTap: (){
                                      showDialog(context:context,child:WebView(
                                      javascriptMode: JavascriptMode.unrestricted,
                                      initialUrl: snapshot.data[index].url.toString(),
                                      ),);
                                },
                                child: Card(
                               elevation: 15.0,
                               margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                               shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(16),
                                   ),
                               child:Column(
                               children:<Widget>[
                                Stack(
                               children: <Widget>[
                                   Card(
                                   child: ClipRRect(
                                     child: FadeInImage.assetNetwork(placeholder: "assets/icon/evrim_agaci.png", image: snapshot.data[index].imageUrl.toString()),
                                     borderRadius: BorderRadius.circular(15),
                                   ),
                                 ),
                               ],
                             ),
                              Container(
                                width: 400.0,
                                child: Center(
                                child: Padding(padding: EdgeInsets.all(15),child: Text(snapshot.data[index].title.toString(),
                                style: TextStyle(
                                  textBaseline: TextBaseline.alphabetic,
                                  fontSize: 18.0,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black
                                ),
                                ),
                                ),
                                ),
                              ),
                          ],
                          ),
                             ),
                           );
                         },
                       );
                       break;
                    }
              },
            ),            
            ),
        ],
      ),
        );
  }

}