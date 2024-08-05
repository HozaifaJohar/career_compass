import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:http/http.dart' as http;

class GetImage {
    String path = '';
  String get pathImage => path;

  String url = AppString.baseUrl;
  final urlReq = 'http://10.0.2.2:3000/employees/get_image';
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<String?> getImage() async {
    var response = await http
        .get(Uri.parse(urlReq), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      if (response.body == 'uploadsimages/null') {
        return null;
      } else {
        path = response.body;
        
        return path;
      }
    } else {
      final jsonResponse = jsonDecode(response.body);
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