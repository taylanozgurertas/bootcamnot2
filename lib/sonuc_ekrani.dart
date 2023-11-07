import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  const SonucEkrani({Key? key}) : super(key: key);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sonuç Ekranı"),),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context); //bir onceki sayfaya gider
            }, child: const Text("Geri Dön")),

            ElevatedButton(onPressed: () {
              //Navigator.popUntil(context, (route) => route.isFirst); //ilk ana sayfaya döndürür. gidene kadar route first olunca git
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SonucEkrani(),));
            }, child: const Text("Ana Sayfaya Geri Dön")),
          ],)
      ),
    );
  }
}
