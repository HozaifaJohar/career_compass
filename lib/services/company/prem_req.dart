import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/foundation.dart';

class PremService {
  String url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<dynamic> postPrem(int level) async {
    var res = await Api().post(
        url: '$url/company/premium_request',
        body: json.encode({"premiumLevel":level}),
        token: token);
    print(res);
  
  }
}
