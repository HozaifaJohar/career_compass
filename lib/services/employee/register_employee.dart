import 'dart:convert';
import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/user_employee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterEmployee {
  String url = AppString.baseUrl;
  Future<UserEmployee> register({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String phone,
  }) async {
    Map<String, dynamic> data =
        await Api().post(url: '$url/employeeAuth/register', body: {
      "name": name,
      "email": email,
      "password": password,
      "gender": gender,
      "phone": phone,
    });
    return UserEmployee.fromJson(data);
  }
}
