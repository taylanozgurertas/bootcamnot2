import 'package:bootcamnot2/bottom_navigation_ornek/sayfa_bir.dart';
import 'package:bootcamnot2/bottom_navigation_ornek/sayfa_iki.dart';
import 'package:bootcamnot2/bottom_navigation_ornek/sayfa_uc.dart';
import 'package:flutter/material.dart';

class BottomSayfa extends StatefulWidget {
  const BottomSayfa({Key? key}) : super(key: key);

  @override
  State<BottomSayfa> createState() => _BottomSayfaState();
}

class _BottomSayfaState extends State<BottomSayfa> {

  int secilenIndeks = 0;
  var sayfalar = [const SayfaBir(), const SayfaIki(), const SayfaUc()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation"), backgroundColor: Colors.deepPurple,),
      body: sayfalar[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one_outlined), label: "Bir"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two_outlined), label: "İki"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3_outlined), label: "Üç"),
        ],
        currentIndex: secilenIndeks,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white38,
        onTap: (indeks) {
          setState(() {
            secilenIndeks = indeks;
          });
        },
      ),
    );
  }
}
