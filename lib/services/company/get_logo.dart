import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetLogo extends ChangeNotifier {
  String path = '';
  String get pathImage => path;

  String url = AppString.baseUrl;
  final urlReq = 'http://10.0.2.2:3000/company/get_logo';
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<String?> getLogo() async {
    var response = await http
        .get(Uri.parse(urlReq), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      if (response.body == 'uploadsimages/null') {
         print('1111');
        return null;
      }else{
     path = response.body;
      notifyListeners();
      return path;

      }
     } else {
      final jsonResponse = jsonDecode(response.body);
      print('111');
      print(jsonResponse);
      return jsonResponse['image_path'];
    }
  }
}
 // var response = await http
    //     .get(Uri.parse(urlReq), headers: {'Authorization': 'Bearer $token'});
    // if (response.statusCode == 200) {
    //   print(response.body);
    //   path = response.body;
    //   notifyListeners();
    //   // The response is likely a direct image path
    //   return path;
    // } else {
    //   // The response is likely a JSON string
    //   final jsonResponse = jsonDecode(response.body);
    //   print(jsonResponse);
    //   return jsonResponse['image_path'];
    // }