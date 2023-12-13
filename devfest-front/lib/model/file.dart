import 'package:flutter/material.dart';

class Filee extends ChangeNotifier{
  late final String titel;
  // late final String discreption;
  bool isDone=false;

  Filee({required this.titel,required this.isDone});

    factory Filee.fromJson(Map<String,dynamic> map) => Filee(
    titel: map["text"],
    isDone: map["is_finished"],
    // discreption: map["description"]as String,

  );
  set setIsDone(bool x){
    isDone=x;
    notifyListeners();
  }

}