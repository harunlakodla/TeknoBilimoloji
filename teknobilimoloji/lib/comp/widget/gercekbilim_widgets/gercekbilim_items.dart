import 'package:flutter/material.dart';

class GercekBilim_Items extends StatefulWidget {

  final int index;
  final String icon;
  final String title;
  final String link;
  

  const GercekBilim_Items({Key key, this.icon, this.title,this.index,this.link}) : super(key: key);

  @override
  _GercekBilim_ItemsState createState() => _GercekBilim_ItemsState();
}

class _GercekBilim_ItemsState extends State<GercekBilim_Items> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>print('object'),
      child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 350,
              color: Colors.blue[100 * ((widget.index % 5) + 1)],
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        left: 0.0,
                        height: 200.0,
                        child: Image.network(widget.icon,fit: BoxFit.fill,),
                      ),
                      Positioned(
                        top: 215.0,
                        right: 20.0,
                        left: 10.0,
                        child: Center(
                          child: Text(widget.title.toString()),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.95, 0.8),
                        child: Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Image.network('https://pbs.twimg.com/profile_images/528202476147576834/HMfej3gB.jpeg',fit: BoxFit.fill,),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ),
        ),
    );
  }
}