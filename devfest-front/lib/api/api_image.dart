import 'dart:convert';
import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:devfest/model/image.dart';
import 'package:http/http.dart' as http;

class ApiProgresseImgController {
  Future<List<ProgresseImg>?> fetchProgresseImg() async {
    final uri = Uri.parse(Api.progresseImgEndPoint); //endpoint place
    final respons = await http.get(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },);
    
    if(respons.statusCode==200){
      var data = json.decode(respons.body);
      data = data["progress"];

      List<ProgresseImg> tmp=[];
      for(var i in data){
        tmp.add(ProgresseImg.fromJson(i));
      }
      
      return tmp;
    }
    else{
      return null;
    }
  }
}
