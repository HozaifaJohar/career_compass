import 'package:career_compass/models/user_employee.dart';
import 'package:career_compass/services/employee/employee_requests/get_info.dart';
import 'package:flutter/material.dart';

class InfoHelper with ChangeNotifier {
  String _name = '';
  String _address = '';
  String _phone = '';
  String _birthday = '';
  String _gender = 'Male';

  String get name => _name;
  String get address => _address;
  String get phone => _phone;
  String get birthday => _birthday;
  String get gender => _gender;

  Future<void> fetchAndSetUserdata() async {
    UserEmployee userData = await Info().get(
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6ImltYWQiLCJlbWFpbCI6ImltYWRmZmZmQGdtYWlsLmNvbSIsImdlbmRlciI6Im1hbGUiLCJpYXQiOjE3MjI3NTg3NDAsImV4cCI6MTcyMzM2MzU0MH0.NXQXnJO3clVzL8qswvoAhLcmAgAN5yV23g_HL6LV0ZU',
    );
    UserEmployee user = userData;
    _gender = user.gender;
    _name = user.name;
    _birthday = user.birthdayDate;
    _phone = user.phone;
    _address = user.homeAddress;
    notifyListeners();
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setHomeAddress(String value) {
    _address = value;
    notifyListeners();
  }

  void setPhone(String value) {
    _phone = value;
    notifyListeners();
  }

  void setBirthdayDate(String value) {
    _birthday = value;
    notifyListeners();
  }

  void setGender(String value) {
    _gender = value;
    notifyListeners();
  }
}
