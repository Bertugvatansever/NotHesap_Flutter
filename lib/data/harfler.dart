import 'package:flutter/material.dart';

import '../model/ders.dart';

class DataHelper{

  static List<Ders> tumeklenenDersler = [];

  static dersEkle(Ders ders){
    tumeklenenDersler.add(ders);
  }
  
  static List<String> _tumDerslerinHarfleri(){
    return["AA","BA","BB","CB","CC","DD","FD","FF"];
  }

  static List<int> _tumkrediler(){
    return List.generate(10, (index) => index +1).toList();
  }

  static double OrtalamaHesapla(){
    double toplamnotDegeri = 0;
    double toplamKredi = 0;
    tumeklenenDersler.forEach((element) {
      toplamnotDegeri=toplamnotDegeri + (element.krediDegeri*element.harfDegeri);
      toplamKredi += element.krediDegeri;
    });
    return toplamnotDegeri/toplamKredi; 
  }
  static double _harfiNotaCevir(String harf){
    switch(harf){
      case"AA":
      return 4;
      case"BA":
      return 3.5;
      case"BB":
      return 3;
      case"CB":
      return 2.5;
      case"CC":
      return 2;
      case"DD":
      return 1.5;
      case"FD":
      return 1;
      case"FF":
      return 0.0;
      default:
      return 1;
      
    }
  }
  static List<DropdownMenuItem<double>> tumDerslerinHarfleri(){
    return _tumDerslerinHarfleri().map((e) => DropdownMenuItem(child: Text(e),value: _harfiNotaCevir(e),)).toList();
  }
  static List<DropdownMenuItem<double>> tumderslerinKredileri(){
    return _tumkrediler().map((e) => DropdownMenuItem(child: Text(e.toString()),value: e.toDouble())).toList();
  }
}