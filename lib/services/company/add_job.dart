import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';

class AddJobServices extends ChangeNotifier {
  String url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<Map<String, dynamic>> addJob(
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
    var data = await Api().post(
        url: '$url/job',
        body: {
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
        },
        token: token);
    print(data);
    return data;
  }
}
