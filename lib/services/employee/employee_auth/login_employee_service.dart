import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';

class LogInEmployeeService extends ChangeNotifier {
  String url = AppString.baseUrl;

  Future<String> returnAccessToken({
    required String email,
    required String password,
  }) async {
    var accessToken = await Api().post(url: '$url/employeeAuth/login', body: {
      'email': email,
      'password': password,
    });
    var result = '';
    if (accessToken['statusCode'] == 403) {
      result = "error";
    } else {
      result = accessToken["access_token"];
      CashMemory().insertToCash(key: 'accessToken', value: result);
      // print(
      //     'saved access toke successfully${CashMemory().getCashData(key: 'accessToken')}');
    }
    return result;
  }
}
