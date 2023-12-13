import 'dart:convert';
import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:http/http.dart' as http;

class ApiLoginController {
  Future<String?> fetchLogin(String username,String password) async {
    final uri = Uri.parse(Api.loginEndPoint); //endpoint place
    final respons = await http.post(uri,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(<String,dynamic>{
      "username":username,
      "password":password
    }));

    if(respons.statusCode==200){
      final data = json.decode(respons.body);
      return data["auth_token"];
    }
    else{
      return null;
    }
  }
  Future<bool?> fetchCust() async {
    final uri = Uri.parse(Api.cusEndPoint);
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" }
    );

    if(respons.statusCode==200){
      var data = json.decode(respons.body);
      data = data["data"];
      return data["is_delivered"];
    }
    else{
      return null;
    }
  }

}
