import 'package:flutter/material.dart';

class Notif extends ChangeNotifier{
  late final int id; 
  late final String titel;
  late final String discreption;
  late final int type;
  bool isDone=false;

  Notif({required this.id,required this.titel,required this.discreption,required this.type,required this.isDone});

    factory Notif.fromJson(Map<String,dynamic> map) => Notif(
    id: map["id"],
    titel: map["title"],
    discreption: map["description"],
    isDone: map["is_reded"],
    type: map["type"]
  );

  set setIsDone(bool x){
    isDone=x;
    notifyListeners();
  }

}