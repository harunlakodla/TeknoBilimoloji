import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:teknobilimoloji/comp/pages/teknobilimoloji.dart';



import 'mainactivity.dart';



class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedItem;
  List<Widget> pencereler=[MainActivity(),TeknoBilimoloji()];

  

   @override
   initState(){
     _selectedItem=0;
     super.initState();
   }
  Widget pencere(int index){
    return pencereler[index];
  }

  Widget sayfagecisleri(int index){
    
    switch(index){
      case 0:
          return MainActivity();
        break;
      case 1:
        return TeknoBilimoloji();
      break; 
      case 2:
        
      break;
      default:
      
      break;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pencere(_selectedItem),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.home,
            title: 'Anasayfa'
          ),
          TabData(
            iconData:Icons.account_balance,
            title: 'Teknoloji ve Bilim'
          ),
         
        ],
        circleColor: Colors.grey,
        textColor: Colors.white,
        initialSelection: 0,
        activeIconColor: Colors.deepOrange,
        barBackgroundColor: Colors.amber,
        onTabChangedListener: (position) {
        setState(() {
        _selectedItem = position;
        sayfagecisleri(_selectedItem);
        });
        },
      ),
    );
  }
}