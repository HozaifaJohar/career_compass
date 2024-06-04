import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthCompany extends ChangeNotifier {
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

  Future<Map<String, dynamic>> login(String email, String password) async {
    var data = await Api().post(
        url: '$url/companyAuth/login',
        body: {"email": email, "password": password});
    print(data);
    String accessToken = data["access_token"];
    print(accessToken);
    return data;
  }
}
