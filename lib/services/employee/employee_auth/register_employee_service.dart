import 'dart:async';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/user_employee.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class RegisterEmployeeSrevice extends ChangeNotifier {
  String url = AppString.baseUrl;
   String _resMessage = '';
  String get resMessage => _resMessage;
  // final bool _isLoggedIn = false;
  // bool get authenticated => _isLoggedIn;

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String gender,
    required String phone,
    required String homeAddress,
    required String birthDayDate,
    required String description,
  }) async {
    //Map<String, dynamic> data = await Api().post(
    var data = await Api().post(
      url: '$url/employeeAuth/register',
      body: {
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "phone": phone,
        "home_address": homeAddress,
        "birthday_date": birthDayDate,
        "description":description
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

//   void register(Map userEmployee) async {
//     try {
//       await Api().post(url: '$url/employeeAuth/register', body: userEmployee);
//     } catch (e) {
//       print(e);
//     }
//   }

//   void logOut() {}

//   // return UserEmployee.fromJson(data);
}

// "name": name,
// "email": email,
// "password": password,
// "gender": gender,
// "phone": phone,
// "home_address": homeaddress,
// "birthday_date": birthdayDate

// class UserModel with ChangeNotifier {
//   String _name;

//   UserModel(this._name);

//   String get name => _name;

//   void setName(String newName) {
//     _name = newName;
//     notifyListeners();
//   }
// }


// class Screen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screen 2'),
//       ),
//       body: Center(
//         child: Consumer<UserModel>(
//           builder: (context, userModel, child) {
//             return Text('Name: ${userModel.name}');
//           },
//         ),
//       ),
//     );
//   }