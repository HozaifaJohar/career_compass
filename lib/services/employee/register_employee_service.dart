import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/user_employee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class RegisterEmployeeSrevice extends ChangeNotifier {
  String url = AppString.baseUrl;
  final bool _isLoaggedIn = false;
  void register(Map userEmployee) async {
    try {
      await Api().post(url: '$url/employeeAuth/register', body: userEmployee);
    } catch (e) {
      print(e);
    }
  }

  void logOut() {}

  // return UserEmployee.fromJson(data);
}

      // "name": name,
      // "email": email,
      // "password": password,
      // "gender": gender,
      // "phone": phone,
      // "home_address": homeaddress,
      // "birthday_date": birthdayDate