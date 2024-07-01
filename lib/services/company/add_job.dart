import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';

class AddJobServices extends ChangeNotifier {
  String url = AppString.baseUrl;
    bool _isLoading = false;
  String _resMessage = '';
    bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  String token = CashMemory().getCashData(key: 'accessToken');

 void addJob(
      String title,
      int typeId,
      int levelId,
      List<int> categoryIds,
      List<int> subCategoryIds,
      String description,
      int salary,
      int workHours,
      int experience,
      int maxEmo,
      String gender) async {
  _isLoading = true;
    notifyListeners();
    var bodyJson = {
      "title": title,
      "typeId": typeId,
      "levelId": levelId,
      "categoryIds": categoryIds,
      "subCategoryIds": subCategoryIds,
      "description": description,
      "salary": salary,
      "work_hours": workHours,
      "experience_years": experience,
      "number_of_employees": maxEmo,
      "wanted_gender": gender
    };
    var data = await http.post(Uri.parse('$url/job'), body: json.encode(bodyJson),headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },);
    int statusCode = data.statusCode;
    print('Status Code: $statusCode');
    if(data.statusCode==200 || data.statusCode==201){
    _isLoading = false;
    _resMessage = "Job Added Successfully!";
      notifyListeners();
    }else {
        final res = json.decode(data.body);

        _resMessage = res['message'];

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    var d = jsonDecode(data.body);
    print(d);
    
  }
}
