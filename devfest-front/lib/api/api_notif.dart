
import 'dart:convert';

import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/model/notif.dart';
import 'package:http/http.dart' as http;

class ApiNotifController {
  Future<List<Notif>?> fetchNotif() async {
    final uri = Uri.parse(Api.notifEndPoint); //endpoint place
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },);

    if(respons.statusCode==200){
      var data = json.decode(respons.body);

      List<Notif> tmp=[];
      for(var i in data){
        tmp.add(Notif.fromJson(i));
      }
      return tmp;
    }
    else{
      return null;
    }
  }
}
