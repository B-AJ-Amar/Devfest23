import 'dart:convert';

import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/ui/screen/LoginScreen/User_2/Feeds/tabhandel.dart';
import 'package:http/http.dart' as http;
import 'package:devfest/model/feed.dart';

class ApiFeedController {
  Future<List<Feed>?> fetchFeed(int id) async {
    final uri = Uri.parse("${Api.feedEndPoint}${id}"); //endpoint place
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },);

    if(respons.statusCode==200){
      var data = json.decode(respons.body);
      data = data["data"];

      List<Feed> tmp=[];
      for(var i in data){
        tmp.add(Feed.fromJson(i));
      }
      return tmp;
    }
    else{
      return null;
    }
  }
  
  Future<List<TTab>?> fetchTypes() async {
    final uri = Uri.parse(Api.typeEndPoint); //endpoint place
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },);

    if(respons.statusCode==200){
      var data = json.decode(respons.body);

      List<TTab> tmp=[];
      for(var i in data){
        tmp.add(TTab.fromJson(i));
      }
      return tmp;
    }
    return null;
  }

  Future<void> addFeed(String discreption) async {
    final uri = Uri.parse(Api.typeEndPoint); //endpoint place
    await http.post(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },
    body: {
      "discreption" : jsonEncode(<String,dynamic>{
      "discreption":discreption,
    })
    }
  );
  }
}
