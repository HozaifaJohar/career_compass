import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class SetStatics {
  String url = AppString.baseUrl;

  Future postStatics({
    required List<Map<String, String>> allCategories,
    required String accessToken,
  }) async {
    var bodyJson = allCategories;
    print('///$allCategories/hiii iam herea/$accessToken///');
    var response = await Api().post(
      url: '$url/employees/set_statics',
      body: json.encode(bodyJson),
      token: accessToken,
    );
  }
}
