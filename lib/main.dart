import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/Sabitler.dart';
import 'package:not_hesaplama/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Sol yukarıda Chrome da gözüken kısım
      title: "Dinamik Ortalama Hesapla",
      // Debug modunda olmadığını belirtir
      debugShowCheckedModeBanner: false,
      //uygulamanın ana renk temaları
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        //Platformun farklı farklı şekillerde düzgün görünmesini sağlayan kod
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}