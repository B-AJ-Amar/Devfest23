import 'package:flutter/material.dart';

class Payement extends ChangeNotifier{
  late final String date;
  late final String price;
  bool isDone=false;

  Payement({required this.date,required this.price,required this.isDone});

    factory Payement.fromJson(Map<String,dynamic> map) => Payement(
    date: map["date"],
    price: map["price"],
    isDone: map["is_paid"]
  );

  set setIsDone(bool x){
    isDone=x;
    notifyListeners();
  }

}