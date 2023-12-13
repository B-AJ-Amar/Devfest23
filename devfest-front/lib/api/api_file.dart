
import 'dart:convert';

import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/model/file.dart';
import 'package:http/http.dart' as http;

class ApiFileController {
  Future<List<Filee>?> fetchFile() async {
    final uri = Uri.parse(Api.fileEndPoint); //endpoint place
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },);

    if(respons.statusCode==200){
      var data = json.decode(respons.body);
      data = data["date"];

      List<Filee> tmp=[];
      for(var i in data){
        tmp.add(Filee.fromJson(i));
      }
      return tmp;
    }
    else{
      return null;
    }
  }
}
