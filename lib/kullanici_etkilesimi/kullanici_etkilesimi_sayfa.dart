import 'package:flutter/material.dart';

class KullaniciEtkilesimiSayfa extends StatefulWidget {
  const KullaniciEtkilesimiSayfa({Key? key}) : super(key: key);

  @override
  State<KullaniciEtkilesimiSayfa> createState() => _KullaniciEtkilesimiSayfaState();
}

class _KullaniciEtkilesimiSayfaState extends State<KullaniciEtkilesimiSayfa> {

  var tfControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kullanıcı Etkilesimi"),),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: const Text("Silmek istiyor musunuz?"),
                    backgroundColor: Colors.white,
                    action: SnackBarAction(label: "Evet", onPressed: (){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                            backgroundColor: Colors.white,
                            duration: Duration(seconds: 1),
                            content: Text("Silindi"),
                          ));
                    },),
                  )
              );
            }, child: const Text("Snackbar")),

            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title:  const Text("Başlık"),
                  content:  const Text("içerik"),
                  actions: [
                    TextButton(onPressed: () {
                      print("iptal seçildi");
                      Navigator.pop(context);
                    }, child: const Text("İptal")),
                    TextButton(onPressed: () {
                      print("tamam seçildi");
                      Navigator.pop(context);
                    }, child: const Text("tamam"))
                  ],
                );
              },);
            }, child: const Text("Snackbar (Özel)")),

            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title:  const Text("Kayıt İşlemi"),
                  content:  TextField(
                      controller: tfControl,
                      decoration: const InputDecoration(hintText: "Veri"),

                  ),
                  actions: [
                    TextButton(onPressed: () {
                      print("iptal seçildi");
                      Navigator.pop(context);
                    }, child: const Text("İptal")),
                    TextButton(onPressed: () {
                      print("kaydet seçildi");
                      Navigator.pop(context);
                    }, child: const Text("Kaydet"))
                  ],
                );
              },);
            }, child: const Text("Alert")),

            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title:  const Text("Kayıt İşlemi"),
                  content:  TextField(
                    controller: tfControl,
                    decoration: const InputDecoration(hintText: "Veri"),
                  ),
                  actions: [
                    TextButton(onPressed: () {
                      print("iptal seçildi");
                      Navigator.pop(context);
                    }, child: const Text("İptal")),
                    TextButton(onPressed: () {
                      print("kaydet seçildi");
                      Navigator.pop(context);
                      String alinanVeri = tfControl.text;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(alinanVeri)));
                      tfControl.text = "";
                    }, child: const Text("Kaydet"))
                  ],
                );
              },);
            }, child: const Text("Alert (Özel)")),
          ],
        ),
      ),
    );
  }
}
