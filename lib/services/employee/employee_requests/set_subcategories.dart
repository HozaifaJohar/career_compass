import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class SubCategories {
  final url = AppString.baseUrl;

  Future<void> post({
    required String accessToken,
    required List<Map<String, String>> allSubCategories,
  }) async {
    List<Map<String, String>> bodyJson = allSubCategories;
    await Api().post(
      url: '$url/employees/set_subcategories',
      body: json.encode(bodyJson),
      token: accessToken,
    );
  }
}
