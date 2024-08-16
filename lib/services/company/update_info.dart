import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';

class Update {
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<void> updateInf(
      String name, String phone, String address, String desc) async {
    var res = await Api().put(
        url: '$url/company/update_company',
        body: json.encode({
          "company_name": name,
          "phone": phone,
          "address": address,
          "description": desc
        }),
        token: token);
    print(res);
  }
}
