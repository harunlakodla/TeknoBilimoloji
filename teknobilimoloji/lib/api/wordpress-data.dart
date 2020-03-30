import 'package:http/http.dart' as http;//http adında çapırabilmek iiçin http dedik

import 'package:teknobilimoloji/api/wordpress-model.dart';
import 'package:teknobilimoloji/links/links.dart';
import 'package:teknobilimoloji/ui/evrim_agaci/items_maps/evrimagaci_categori_items.dart';
import 'package:webfeed/webfeed.dart';

class GetRssWordPress{

  String url="";//1 kere işlem yapabilmek için url tanımladık

  GetRssWordPress({this.url});// gelen url i yakalayabilmek için 

  List<WordPressModel> listwordpress;// model göre şekilllebilir bir list oluşturduk...

  List link=GetEvrimAgaciCategroiItems().getLink();
  bool giris=false;

  Future<List<WordPressModel>> getRss() async {
    //htttp kütüphasinden url e istek atıyoruz
    var data = await http.get(url,headers:{"Content-Type":"application/json"});
    listwordpress=new List();

    //gelen datanın body kısmının strin olarak alıp rss fedd kütüphanesinden yararlanarak parçalıyoruz
    var rssFeed=new RssFeed.parse(data.body.toString());

    //burada ne kadar item var ise for ile döndürmesi gerektiğini diyoruz
    
      //print(link[index].toString());

    if((url==BilimOrgUrl)||(url==BilimFiliUrl)||(url==AcikBilimUrl)||(url==KozmikAnaforUrl)){
        for(int i=0;i<rssFeed.items.length;i++){
            listwordpress.add(new WordPressModel(
            title: rssFeed.items[i].title,
            //icon: rssFeed.image.url,
            url: rssFeed.items[i].link,
            descripton: rssFeed.items[i].description,
            pubDate: rssFeed.items[i].pubDate
            ));      
      }
  }
      else{
           for(int i=0;i<rssFeed.items.length;i++){
      // ve listeye ataması yapıyoruz
              listwordpress.add(new WordPressModel(
              title: rssFeed.items[i].title,
              imageUrl: rssFeed.items[i].media.thumbnails[0].url,
              url: rssFeed.items[i].link,
              descripton: rssFeed.items[i].description,
              pubDate:rssFeed.items[i].pubDate,
            ));
                
            }
    }
    

    // return ediyoruz fonksiyonu
    return listwordpress;
    
  }




}