import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:teknobilimoloji/comp/Get/getrss.dart';
import 'package:teknobilimoloji/comp/Get/wordpress.dart';
import 'package:teknobilimoloji/comp/animation/bubbles.dart';

import 'package:teknobilimoloji/comp/pages/bilimfili.dart';
import 'package:teknobilimoloji/comp/pages/bilimorg.dart';
import 'package:teknobilimoloji/comp/pages/evrimagaci.dart';
import 'package:teknobilimoloji/comp/pages/gercekbilim.dart';
import 'package:teknobilimoloji/comp/pages/kozmikanafor.dart';
import 'package:teknobilimoloji/comp/pages/teknobilimoloji.dart';



class MainActivity extends StatefulWidget {
  @override
  _MainActivity createState() => _MainActivity();
}

class _MainActivity extends State<MainActivity> {

 int _selected=0;
 

  List<Widget> _body=[BilimFili(),GercekBilim()];
  List sayfalar=['Bilim Fili','Gerçek Bilim'];

 ScrollController scrollController=new ScrollController();
 List<ScreenHiddenDrawer> itens = new List();

  @override
  void initState() {

     itens.add(new ScreenHiddenDrawer(
       new ItemHiddenMenu(
          name: "Evrim Ağacı",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.black,
        ),
            EvrimAgaci()));

     itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Gerçek Bilim",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
        ),
         GercekBilim()
          )
        );
        
        itens.add(new ScreenHiddenDrawer(
       new ItemHiddenMenu(
          name: "TeknoBilimoloji",
          baseStyle: TextStyle( color: Colors.black.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.black,
        ),
            TeknoBilimoloji()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return HiddenDrawerMenu(
      initPositionSelected: 0,
      screens: itens,
      backgroundColorAppBar: Colors.white,
      backgroundColorMenu: Colors.cyan,
      iconMenuAppBar: const Icon(Icons.image_aspect_ratio,color: Colors.cyan,size: 32,),
      
    );
  }
}