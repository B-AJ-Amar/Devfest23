import 'package:flutter/material.dart';

class BottomNavHandel extends ChangeNotifier{
  
  int selectedPart=0;

  set setSelectedPart(int selected){
    selectedPart=selected;
    notifyListeners();
  }


}