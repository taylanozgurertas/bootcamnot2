import 'package:bootcamnot2/anasayfa.dart';
import 'package:bootcamnot2/bottom_navigation_ornek/bottom_sayfa.dart';
import 'package:bootcamnot2/kullanici_etkilesimi/kullanici_etkilesimi_sayfa.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KullaniciEtkilesimiSayfa(),
    );
  }
}
