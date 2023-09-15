import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/Sabitler.dart';
import 'package:not_hesaplama/data/harfler.dart';
import 'package:not_hesaplama/model/ders.dart';
import 'package:not_hesaplama/widgets/ders_listesi_goster.dart';
import 'package:not_hesaplama/widgets/ortalama_g%C3%B6ster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenDeger = 4;
  double secilenkrediDeger = 4;
  String girilendersAdi = "";
  @override
  Widget build(BuildContext context) {
    // Scaffold MaterialAppdaki home un devamında kullanılan widget
    return Scaffold(
      appBar: AppBar(
        //Arka planı tamamen şeffaf yapan bir renk
        backgroundColor: Colors.transparent,
        //Bunu eklemez isen arka kısım tamamen gitmez
        elevation: 0,
        title: Center(child:Text(Sabitler.baslik,style: Sabitler.baslikStyle,)),
      ),
      body: Column(
        //Column içinde kullanılan crossAxis yatay düzleme işlem yapar.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Row(
          children: [
            Expanded(
              //Rowun içindeki hangi kısıma ne kadar alan verileceğini seçer
              flex: 2,
              child: _buildForm() ,
            ),
            Expanded(
              flex: 1,
              child: OrtalamaGoster(dersSayisi: DataHelper.tumeklenenDersler.length,ortalama: DataHelper.OrtalamaHesapla(),),
            )
          ],

         ),
          Expanded(
            child:DersListesi(
            )
          ),
          //liste
        ],

      )
         );
  }
  
  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(padding:EdgeInsets.symmetric(horizontal: 8),child:_buildTextFormField()),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),child:_buildHarfler() ,)),
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8),child:_buildKrediler() ,)),
              IconButton(
                onPressed:_dersekleveOrtalamaHesapla,                                                     
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,iconSize: 30,
                ),
            ],

          ),
          SizedBox(
            height: 5,
          )
        ],
      ),

    );
  }
  
  TextFormField _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilendersAdi=deger!;
        });
      },
      //formun içine girilen elemanları sorgulamak için kullanılır.
      validator: (s){
        if(s!.length <=0){
          return "Ders adini giriniz";
        }
        else
        return null;
      },
      decoration: InputDecoration(
        hintText: "Ders Adi",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2)),
      );
  }
  
  Container _buildHarfler() {

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius
      ),
      child: DropdownButton<double>(
        value: secilenDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged:(value){
          setState(() {
            secilenDeger = value!;
            
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri()
      ),
    );
  }
  Container _buildKrediler() {

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius
      ),
      child: DropdownButton<double>(
        value: secilenkrediDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged:(value){
          setState(() {
            secilenkrediDeger = value!;
            
          });
        },
        underline: Container(),
        items: DataHelper.tumderslerinKredileri()
      ),
    );
  }
  
  void _dersekleveOrtalamaHesapla() {
  if(formKey.currentState!.validate()){
    formKey.currentState!.save();
    var eklenecekDers = Ders(girilendersAdi, secilenDeger, secilenkrediDeger);
    print(eklenecekDers);
    DataHelper.dersEkle(eklenecekDers);
    setState(() {
      
    });
  }
  

}
}