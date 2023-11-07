import 'package:bootcamnot2/kisiler.dart';
import 'package:bootcamnot2/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {

  Kisiler kisi;

  OyunEkrani({super.key, required this.kisi});


  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

//leading - left - start
//trailing right - end

class _OyunEkraniState extends State<OyunEkrani> {

  Future<bool> geriDonusTusu(BuildContext context) async{
    print("Navigation geri tuşu seçildi");
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Oyun Ekranı"),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () {
          Navigator.pop(context);
          print("appbar geri tuşu seçildi");
        },)

      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Text("${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.bekar} - ${widget.kisi.boy}"),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SonucEkrani(),));
              }, child: const Text("Bitti")),
            ],)
        ),
      ),
    );
  }
}
