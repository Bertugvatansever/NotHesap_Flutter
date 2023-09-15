import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/Sabitler.dart';
import 'package:not_hesaplama/data/harfler.dart';

import '../model/ders.dart';

class DersListesi extends StatefulWidget {
  const DersListesi({Key? key}):super(key:key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumeklenenDersler;
    return tumDersler.length>0 ? ListView.builder(itemCount: tumDersler.length,itemBuilder: (context, index)
    {
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed: (a){
          DataHelper.tumeklenenDersler.removeAt(index);
          
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text((tumDersler[index].harfDegeri * tumDersler[index].krediDegeri).toStringAsFixed(0)),
              ),
              subtitle: Text("${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
            ),
          ),
        ),
      );
    }
    ): Center(
      child: Container(
        child: Text("Lütfen Ders Ekleyin",style: Sabitler.baslikStyle,),
      ),
    );
  
  } 
}