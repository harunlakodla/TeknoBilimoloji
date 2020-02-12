import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

//String url='http://feeds.feedburner.com/GercekBilim/';
//https://popsci.com.tr/feed/
//view-source:http://feeds.feedburner.com/GercekBilim
//
//burada getRss adında bir sayfa olusturduk ve buradan bilgileri çekiceğiz
class GetRss{
  //final diyerek bir kere kullan tarzında deöiş oluyoruz 
 final String url;
  //burada constructırı tanımlıyoruz bu sayfayı çağırdıgımız da bize bu bilgiyi doldurmamız gerektirdiğini istiyoruz
  GetRss({this.url});
  //getRss icerisinde generik olarak bize Future u list göndermesi gerektiğini söylüyoruz
  //ve listin hhangi tipte döneceğine dair listin jenerigini tanımladıgımız  model tiğinde dönmesini istiyoruz
  //async ile arka planda halledilmesini istiyoruz
Future<List<Noticia>> getRss() async {
//asagıda  http küütphanesininget methodunu kullanıyoruz
var data=await http.get(url,headers:{"Content-Type":"application/json"});
// url yazan yazan yerde ise giriş yapılacak url yi belirliyoruz 
List <Noticia> noticia = new List();
// noticia tipinde bir list tipinde bir list tanımladık
// RssFeed ile bir parse işlemi yap demiş oluyoruz...
    var rssFeed =new RssFeed.parse(data.body.toString());
  //yukarıda parse işlemi ile data nıın body kısmını alve parse işlemi yap demiş oluyoruz...
  //ve aşağıda ise rssFedd ten aldıgın uzunlugu for döngüsü ile her item ı noticia içine ekle demiş oluyoruz...
      for(int i=0;i<rssFeed.items.length;i++){

        
        noticia.add(new Noticia(
                  title: rssFeed.items[i].title,
                  //icon: rssFeed.image.url,
                  link: rssFeed.items[i].link,
                  description: rssFeed.items[i].description,
                  pubDate: rssFeed.items[i].pubDate
                  ));         
                 
        print('Title : '+rssFeed.items[i].title.toString());
        
        print('Description : '+rssFeed.items[i].description.toString());
        print('Link : '+rssFeed.items[i].link.toString());
        print('PubDate : '+rssFeed.items[i].toString());
   

      }// for döngüsü bitiş yeri
    return noticia; // burada ise noticia yı bu fonksiyona erişilince geri dönzer demiş oluyoruz...
  }

} 

//burada ise noticia adında bir model olusturmus olduk
class Noticia  {

String title;
String icon;
String link;
String description;
String pubDate;
// burada ise constracktırı tanımlamış olduk...
Noticia({this.title,this.icon,this.link,this.description,this.pubDate});

getTitle()=>title;
getIcon()=>icon;


}