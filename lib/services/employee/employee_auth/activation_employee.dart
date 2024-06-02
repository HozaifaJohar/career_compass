import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActivationEmployeeService extends ChangeNotifier {
  String url = AppString.baseUrl;

  Future<String> ReturnAccessToken({
    required String email,
    required String code,
  }) async {
    String accessToken =
        await Api().post(url: '$url/employeeAuth/activate', body: {
      "email": email,
      "activationCode": code,
    });
    return accessToken;
  }
}
