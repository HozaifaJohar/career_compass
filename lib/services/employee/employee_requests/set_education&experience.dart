import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class SetEducationAndExeperience {
  final url = AppString.baseUrl;

  Future<void> post({
    required Map<String, String> items,
    required String accessToken,
  }) async {
    Map<String, String> bodyJson = items;
    await Api().post(
      url: '$url/employees/set_education&experience',
      body: json.encode(bodyJson),
      token: accessToken,
    );
  }
}
