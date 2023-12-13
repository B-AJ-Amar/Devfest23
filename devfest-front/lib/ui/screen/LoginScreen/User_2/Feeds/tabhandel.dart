import 'package:devfest/model/account.dart';
import 'package:flutter/foundation.dart';

class TabHandell extends ChangeNotifier{
  
  List<TTab>? tabs=[];
  int itemSelected = 0;

  Future<void> setItemSelected(int selected)async {
    itemSelected = selected;
    await Account.getFeed(tabs![itemSelected].id);
    print("=============${Account.feeds}");
    notifyListeners();
  }
}

class TTab{
  int id;
  String name;
  
  TTab({required this.id,required this.name});

  factory TTab.fromJson(Map<String,dynamic> map) => TTab(
    id: map["id"],
    name: map["name"]
  );
}