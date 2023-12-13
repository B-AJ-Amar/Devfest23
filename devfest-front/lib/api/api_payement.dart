
import 'dart:convert';

import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/model/payement.dart';
import 'package:http/http.dart' as http;

class ApiPayementController {
  Future<List<Payement>?> fetchPayement() async {
    final uri = Uri.parse(Api.payementEndPoint); //endpoint place
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },);

    if(respons.statusCode==200){
      var data = json.decode(respons.body);
      data = data["data"];

      List<Payement> tmp=[];
      for(var i in data){
        tmp.add(Payement.fromJson(i));
      }
      return tmp;
    }
    else{
      return null;
    }
  }
}
