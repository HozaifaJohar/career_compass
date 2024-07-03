import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';

class ActivicationCode extends ChangeNotifier {
  String url = AppString.baseUrl;
  Future<Map<String, dynamic>> activicate(String email, String code) async {
    var data = await Api().post(
        url: '$url/companyAuth/activate',
        body: {"email": email, "activationCode": code});
    print(data);
    String token = data['access_token'];
    CashMemory().insertToCash(key: 'accessToken', value: token);
    print(token);
    return data;
  }

  Future<int> resendcode(String email) async {
    int data = await Api().post(
      url: '$url/companyAuth/requestActivationCode',
      body: {"email": email},
    );
    print(data);
    return data;
  }
}
