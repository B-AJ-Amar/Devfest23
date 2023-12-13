
import 'dart:convert';

import 'package:devfest/api/api.dart';
import 'package:devfest/model/account.dart';
import 'package:http/http.dart' as http;

class ApiReportController {
  Future<void> fetchReport(String message) async {
    final uri = Uri.parse(Api.feedEndPoint); //endpoint place
    await http.post(uri,
    headers: {'Content-Type': 'application/json',
    "Authorization":  "Token ${Account.auth_token}" },
    body: jsonEncode(<String,dynamic>{
      "message":message,
    })
    );
  }
}
