import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivationEmployeeService extends ChangeNotifier {
  String url = AppString.baseUrl;

  Future<String> returnAccessToken({
    required String email,
    required String code,
  }) async {
    String result = "";
    var accessToken =
        await Api().post(url: '$url/employeeAuth/activate', body: {
      "email": email,
      "activationCode": code,
    });
    if (accessToken['statusCode'] == 403) {
      result = "error";
    } else {
      result = accessToken["access_token"];
    }
    // .then((value) => value["access_token"])
    // .onError((error, stackTrace) => "error");
    print('acflidsjfaohg $result');
    return result;
  }
}
