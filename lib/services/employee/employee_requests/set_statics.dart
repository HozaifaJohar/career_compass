import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class SetStatics {
  final url = AppString.baseUrl;

  Future<void> post({
    required List<Map<String, String>> allCategories,
    required String accessToken,
  }) async {
    List<Map<String, String>> bodyJson = allCategories;
    await Api().post(
      url: '$url/employees/set_statics',
      body: json.encode(bodyJson),
      token: accessToken,
    );
  }
}
