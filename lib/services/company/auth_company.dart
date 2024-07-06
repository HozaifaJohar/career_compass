import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthCompany extends ChangeNotifier {
  bool isLoad = false;
  String url = AppString.baseUrl;
  Future<int> register(String companyName, String email, String password,
      String phone, String address, String description) async {
    int data = await Api().post(
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
    print(data);
    return data;
  }

  Future<String> login(
      String email, String password, BuildContext context) async {
    var data = await Api().post(
        url: '$url/companyAuth/login',
        body: {"email": email, "password": password});
    print(data);
    String accessToken = data["access_token"];
    String token = data['access_token'];
    CashMemory().insertToCash(key: 'accessToken', value: token);

    Navigator.pushNamed(context, '/navigation_company');
    print(token);

    return data;
  }
}
