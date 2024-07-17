import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthCompany extends ChangeNotifier {
  bool isLoad = false;
  bool get isload => isLoad;
  String _resMessage = '';
  String get resMessage => _resMessage;

  String url = AppString.baseUrl;
  Future<bool> register(String companyName, String email, String password,
      String phone, String address, String description) async {
    print('tttt');
    var data = await Api().post(
      url: '$url/companyAuth/register',
      body: {
        "company_name": companyName,
        "email": email,
        "password": password,
        "phone": phone,
        "address": address,
        "description": description,
      },
    );
    if (data is int) {
      return true;
    } else {
      _resMessage = data['message'].toString();
      notifyListeners();
      return false;
    }
  }

  Future<bool> login(
      String email, String password, BuildContext context) async {
    isLoad = true;
    notifyListeners();
    var data = await Api().post(
        url: '$url/companyAuth/login',
        body: {"email": email, "password": password});
    print(data);
    var token = data["access_token"];

    // String token = data['access_token'];

    if (token != null) {
      isLoad = false;
      CashMemory().insertToCash(key: 'accessToken', value: token);
      print(token);
      _resMessage = 'Login successfully';
      notifyListeners();
      print(_resMessage);
      return true;
    } else {
      _resMessage = data['message'];
      notifyListeners();
      return false;
    }

    // var status = Api().statusCode;
    //print(status);
    //Navigator.pushNamed(context, '/navigation_company');
    // print(token);
  }
}
