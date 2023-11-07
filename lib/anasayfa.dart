import 'package:bootcamnot2/kisiler.dart';
import 'package:bootcamnot2/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {

  const Anasayfa({super.key,});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int sayac = 0;
  bool kontrol = false;

  @override
  void initState(){
    super.initState();
    print("initState çalıştı"); //uygulama açıldığında bir kere
  }

  Future<int> toplama(int sayi1, int sayi2) async {
    int toplam = sayi1+sayi2;
    return toplam;
  }

  @override
  Widget build(BuildContext context) {
    print("build çalıştı"); //her state metodu çalıştığında

    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text("Sonuç : $sayac"),
          ElevatedButton(onPressed: (){
            setState(() { //arayüzü tekrar çalıştır setState içerisindeki kodlardan sonra demek
              sayac+=1;
            });
          }, child: const Text("Tıkla")),

          ElevatedButton(onPressed: () {
            var kisi = Kisiler("Ahmet", 23, 1.78, true);
            Navigator.push(context, MaterialPageRoute(builder: (context) => OyunEkrani(kisi: kisi),))
                .then((value) {
                  print("Anasayfaya dönüldü");
            });
            //context burada olduğumuzu belirtir, route nereye geçiş yapacağımızı
            //oyun ekranına geçiş yapıyoruz
          }, child: const Text("Başla")),

          Visibility(
            visible: kontrol,
            child: const Text("merhaba"),
          ),

          ElevatedButton(onPressed: (){
            setState(() {
              kontrol = true;
            });

          }, child: const Text("Durum 1 (True)")),

          // ? : yöntem
          Text(kontrol ? "Merhaba": "Güle Güle", style: TextStyle(color: kontrol ? Colors.blue : Colors.red)),

          //farklı yöntem
          ((){
            if(kontrol){
              return const Text("Merhaba", style: TextStyle(color: Colors.blue));
            }else{
              return const Text("Güle Güle", style: TextStyle(color: Colors.red));
            }
          }()),

          ElevatedButton(onPressed: (){
            setState(() {
              kontrol = false;
            });
          }, child: const Text("Durum 2 (False)")),

          FutureBuilder<int>(
            future: toplama(10, 20),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text("hata oluştu");
              }

              if(snapshot.hasData){
                return Text("sonuç: ${snapshot.data}");
              }else{
                return const Text('sonuç yok');
              }
            },
          ),


        ],)
      ),
    );
  }
}


/*
Stateful ve stateless yapı

arayüzü güncellememiz gerekiyorsa arayüz durumuna state deniyor eğer classıız stateful özelliğine sahip değilse
arayüzü güncelleyemeyiz. bu nedenle arayüzün güncelleneceği durumlarda stateful yapı ile çalışmamız gerekir.
stateless pek kullanmıyoruz genelde stateful yapılarla çalışıyoruz.

*/