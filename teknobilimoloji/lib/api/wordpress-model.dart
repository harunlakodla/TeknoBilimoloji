
class WordPressModel{

  //modelimizin olustuğu class

  final String title;
  final String imageUrl;
  final String url;
  final String descripton;
  final String pubDate;

  WordPressModel({this.title, this.imageUrl, this.url, this.descripton, this.pubDate});

  get getTitle=>title;
  get getUrl=>url;
  get getDescripons=>descripton;
  
  
}