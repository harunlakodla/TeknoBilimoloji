import 'package:flutter/material.dart';
import 'package:teknobilimoloji/comp/Get/wordpress_data.dart';
import 'package:teknobilimoloji/comp/widget/evrimagaci_widgets/evrimagaci_icon.dart';
import 'package:teknobilimoloji/comp/widget/evrimagaci_widgets/items_maps/evrimagaci_categori_items.dart';
import 'package:url_launcher/url_launcher.dart';

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
    ItemsLink=getItemsLink[Items];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:Fab_OnPressed,
        child: Icon(Icons.web),
        tooltip: 'Web de Aç',
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.amber,
                ),
                child: DropdownButton<String>(
                  value: Items,
                  onChanged: (String newValue){
                    setState(() {
                     Items=newValue;
                      ItemsLink=getItemsLink[newValue];
                    });
                    
                      print(ItemsLink.toString());
                  },
                  items: getItems.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: FutureBuilder(
                future: GetRssWordPres(url: ItemsLink.toString()).getRss(),
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
                           onPageChanged: (index){
                             sayfa=index;
                           },
                           itemCount: snapshot.data.length,
                           itemBuilder: (context,index){
                             
                             link.add(snapshot.data[index].url.toString());

                             return Container(
                               margin: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
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
                                   fit: BoxFit.cover,
                                   ),
                                   ),
                                 ),
                                 EvrimAgaci_Icon(),
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
                            ],
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
      ),
    );
  }

 Fab_OnPressed() async{

           links= link[sayfa];

          if (await canLaunch(links)) { 
            await launch(links);
          } else {
            throw 'Could not launch $links';
          }

  }

}

