

class GetEvrimAgaciCategroiItems{

  List<String> items=[
    'Son İçerikler'
    ,'Doğal Bilimler > Biyoloji'
    ,'Doğal Bilimler > Kimya'
    ,'Doğal Bilimler > Fizik'
    ,'Doğal Bilimler > Yer Bilimleri'
    ,'Formal Bilimler > Aktuarya Bilimleri'
    ,'Formal Bilimler > Matematik '
    ,'Formal Bilimler > İstatistik'
    ,'Formal Bilimler > Sistem Bilimi'
    ,'Formal Bilimler > Bilgi Teorisi'
    ,'Sosyal Bilimler > Antropoloji'
    ,'Sosyal Bilimler > İşletme'
    ,'Sosyal Bilimler > Vatandaşlık Bilgisi'
    ,'Sosyal Bilimler > Kriminoloji'
    ,'Sosyal Bilimler > Kültürel Araştırmalar'
    ,'Sosyal Bilimler > Demografi '
    ,'Sosyal Bilimler > Gelişim Araştırmaları'
    ,'Sosyal Bilimler > Ekonomi (İktisat)'
    ,'Sosyal Bilimler > Eğitim Bilimleri '
    ,'Sosyal Bilimler > Cinsiyet ve Cinsellik Araştırmaları'
    ,'Sosyal Bilimler > Endüstriyel İlişkiler'
    ,'Sosyal Bilimler > Uluslararası Araştırmalar'
    ,'Sosyal Bilimler > Hukuk'
    ,'Sosyal Bilimler > Yasal Yönetim '
    ,'Sosyal Bilimler > Kütüphane Bilimleri'
    ,'Sosyal Bilimler > Dilbilim'
    ,'Sosyal Bilimler > Medya Araştırmaları'
    ,'Sosyal Bilimler > Planlama'
    ,'Sosyal Bilimler > Siyaset Bilimi'
    ,'Sosyal Bilimler > Psikoloji '
    ,'Sosyal Bilimler > Sosyal Hizmet'
    ,'Sosyal Bilimler > Sosyoloji'
    ,'Sosyal Bilimler > Sürdürülebilir Gelişme'
    ,'Uygulamalı Bilimler > Çevre Bilimleri '
    ,'Uygulamalı Bilimler > Agronomi '
    ,'Uygulamalı Bilimler > Hesaplama Bilimleri'
    ,'Uygulamalı Bilimler > Enerji Teknolojileri '
    ,'Uygulamalı Bilimler > Mühendislik'
    ,'Uygulamalı Bilimler > Adli Bilimler '
    ,'Uygulamalı Bilimler > Sağlık Bilimleri '
    ,'Uygulamalı Bilimler > Mikroteknoloji'
    ,'Uygulamalı Bilimler > Askeri Bilimler'
    ,'Beşeri Bilimler > Felsefe'
    ,'Beşeri Bilimler > Sanat '
    ,'Beşeri Bilimler > Klasikler'
    ,'Beşeri Bilimler > Tarih'
    ,'Beşeri Bilimler > Teoloji (İlahiyat)'
    ,'Beşeri Bilimler > Edebiyat '
    ,'Beşeri Bilimler > İletişim'
    ];

    Map itemsLink={
    'Son İçerikler':'https://evrimagaci.org/rss.xml'
    ,'Doğal Bilimler > Biyoloji':'https://evrimagaci.org/kategori/biyoloji-21/rss.xml'
    ,'Doğal Bilimler > Kimya':'https://evrimagaci.org/kategori/kimya-22/rss.xml'
    ,'Doğal Bilimler > Fizik':'https://evrimagaci.org/kategori/fizik-23/rss.xml'
    ,'Doğal Bilimler > Yer Bilimleri':'https://evrimagaci.org/kategori/yer-bilimleri-24/rss.xml'
    ,'Formal Bilimler > Aktuarya Bilimleri':'https://evrimagaci.org/kategori/aktuarya-bilimleri-365/rss.xml'
    ,'Formal Bilimler > Matematik ':'https://evrimagaci.org/kategori/matematik-917/rss.xml'
    ,'Formal Bilimler > İstatistik':'https://evrimagaci.org/kategori/istatistik-996/rss.xml'
    ,'Formal Bilimler > Sistem Bilimi':'https://evrimagaci.org/kategori/sistem-bilimi-1023/rss.xml'
    ,'Formal Bilimler > Bilgi Teorisi':'https://evrimagaci.org/kategori/bilgi-teorisi-1220/rss.xml'
    ,'Sosyal Bilimler > Antropoloji':'https://evrimagaci.org/kategori/antropoloji-367/rss.xml'
    ,'Sosyal Bilimler > İşletme':'https://evrimagaci.org/kategori/isletme-386/rss.xml'
    ,'Sosyal Bilimler > Vatandaşlık Bilgisi':'https://evrimagaci.org/kategori/vatandaslik-bilgisi-394/rss.xml'
    ,'Sosyal Bilimler > Kriminoloji':'https://evrimagaci.org/kategori/kriminoloji-396/rss.xml'
    ,'Sosyal Bilimler > Kültürel Araştırmalar':'https://evrimagaci.org/kategori/kulturel-arastirmalar-397/rss.xml'
    ,'Sosyal Bilimler > Demografi ':'https://evrimagaci.org/kategori/demografi-398/rss.xml'
    ,'Sosyal Bilimler > Gelişim Araştırmaları':'https://evrimagaci.org/kategori/gelisim-arastirmalari-399/rss.xml'
    ,'Sosyal Bilimler > Ekonomi (İktisat)':'https://evrimagaci.org/kategori/ekonomi-iktisat-400/rss.xml'
    ,'Sosyal Bilimler > Eğitim Bilimleri ':'https://evrimagaci.org/kategori/egitim-bilimleri-445/rss.xml'
    ,'Sosyal Bilimler > Cinsiyet ve Cinsellik Araştırmaları':'https://evrimagaci.org/kategori/cinsiyet-ve-cinsellik-arastirmalari-447/rss.xml'
    ,'Sosyal Bilimler > Endüstriyel İlişkiler':'https://evrimagaci.org/kategori/endustriyel-iliskiler-449/rss.xml'
    ,'Sosyal Bilimler > Uluslararası Araştırmalar':'https://evrimagaci.org/kategori/uluslararasi-arastirmalar-451/rss.xml'
    ,'Sosyal Bilimler > Hukuk':'https://evrimagaci.org/kategori/hukuk-452/rss.xml'
    ,'Sosyal Bilimler > Yasal Yönetim ':'https://evrimagaci.org/kategori/yasal-yonetim-453/rss.xml'
    ,'Sosyal Bilimler > Kütüphane Bilimleri':'https://evrimagaci.org/kategori/kutuphane-bilimleri-454/rss.xml'
    ,'Sosyal Bilimler > Dilbilim':'https://evrimagaci.org/kategori/dilbilim-455/rss.xml'
    ,'Sosyal Bilimler > Medya Araştırmaları':'https://evrimagaci.org/kategori/medya-arastirmalari-491/rss.xml'
    ,'Sosyal Bilimler > Planlama':'https://evrimagaci.org/kategori/planlama-506/rss.xml'
    ,'Sosyal Bilimler > Siyaset Bilimi':'https://evrimagaci.org/kategori/siyaset-bilimi-509/rss.xml'
    ,'Sosyal Bilimler > Psikoloji ':'https://evrimagaci.org/kategori/psikoloji-525/rss.xml'
    ,'Sosyal Bilimler > Sosyal Hizmet':'https://evrimagaci.org/kategori/sosyal-hizmet-557/rss.xml'
    ,'Sosyal Bilimler > Sosyoloji':'https://evrimagaci.org/kategori/sosyoloji-558/rss.xml'
    ,'Sosyal Bilimler > Sürdürülebilir Gelişme':'https://evrimagaci.org/kategori/surdurulebilir-gelisme-563/rss.xml'
    ,'Uygulamalı Bilimler > Çevre Bilimleri ':'https://evrimagaci.org/kategori/cevre-bilimleri-302/rss.xml'
    ,'Uygulamalı Bilimler > Agronomi ':'https://evrimagaci.org/kategori/agronomi-567/rss.xml'
    ,'Uygulamalı Bilimler > Hesaplama Bilimleri':'https://evrimagaci.org/kategori/hesaplama-bilimleri-590/rss.xml'
    ,'Uygulamalı Bilimler > Enerji Teknolojileri ':'https://evrimagaci.org/kategori/enerji-teknolojileri-810/rss.xml'
    ,'Uygulamalı Bilimler > Mühendislik':'https://evrimagaci.org/kategori/muhendislik-839/rss.xml'
    ,'Uygulamalı Bilimler > Adli Bilimler ':'https://evrimagaci.org/kategori/adli-bilimler-868/rss.xml'
    ,'Uygulamalı Bilimler > Sağlık Bilimleri ':'https://evrimagaci.org/kategori/saglik-bilimleri-869/rss.xml'
    ,'Uygulamalı Bilimler > Mikroteknoloji':'https://evrimagaci.org/kategori/mikroteknoloji-910/rss.xml'
    ,'Uygulamalı Bilimler > Askeri Bilimler':'https://evrimagaci.org/kategori/askeri-bilimler-911/rss.xml'
    ,'Beşeri Bilimler > Felsefe':'https://evrimagaci.org/kategori/felsefe-493/rss.xml'
    ,'Beşeri Bilimler > Sanat ':'https://evrimagaci.org/kategori/sanat-1271/rss.xml'
    ,'Beşeri Bilimler > Klasikler':'https://evrimagaci.org/kategori/klasikler-1274/rss.xml'
    ,'Beşeri Bilimler > Tarih':'https://evrimagaci.org/kategori/tarih-1376/rss.xml'
    ,'Beşeri Bilimler > Teoloji (İlahiyat)':'https://evrimagaci.org/kategori/teoloji-ilahiyat-1659/rss.xml'
    ,'Beşeri Bilimler > Edebiyat ':'https://evrimagaci.org/kategori/edebiyat-1720/rss.xml'
    ,'Beşeri Bilimler > İletişim':'https://evrimagaci.org/kategori/iletisim-2377/rss.xml'
  };


  getItems()=>items;
  getItemsLink()=>itemsLink;

}