import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class Update {
  Future<void> setInfo({
    required String name,
    required String address,
    required String phone,
    required String birthday,
    required String gender,
    required String token,
  }) async {
    final url = AppString.baseUrl;
    final response = await Api().put(
      url: '$url/employees/update',
      body: jsonEncode({
        "name": name,
        "gender": gender,
        "phone": phone,
        "home_address": address,
        "birthday_date": birthday,
      }),
      token: token,
    );
    print(response);
    // if (response is Map && response.containsKey('statusCode')) {
    //   if (response['statusCode'] == 400) {
    //     return false;
    //   }
    // }
    // return true;
  }
}
