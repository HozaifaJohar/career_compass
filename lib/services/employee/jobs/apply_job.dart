import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class Apply {
  Future<void> post({required String token, required int id}) async {
    final url = AppString.baseUrl;
    await Api().post(
      url: '$url/employees/apply_for_job',
      body: jsonEncode({"job_id": id}),
      token: token,
    );
  }
}
