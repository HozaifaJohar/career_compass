import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';

class ActivicationCode extends ChangeNotifier {
  String _resMessage = '';
  String get resMessage => _resMessage;
  String url = AppString.baseUrl;
  Future<bool> activicate(String email, String code) async {
    var data = await Api().post(
        url: '$url/companyAuth/activate',
        body: {"email": email, "activationCode": code});
    print(data);
    var token = data['access_token'];
    if (token != null) {
      CashMemory().insertToCash(key: 'accessToken', value: token);
      return true;
    } else {
      _resMessage = data['message'];
      notifyListeners();
      return false;
    }
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
