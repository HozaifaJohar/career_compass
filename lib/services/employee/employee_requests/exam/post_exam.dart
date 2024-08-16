import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';

class ApplyToExam {
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<void> sendResult(int subId, int result) async {
    var body = {"subcategoryId": subId, "result": result};
    var res = await Api().post(
        url: '$url/employees/post_exam_result',
        body: json.encode(body),
        token: token);
    print(res);
  }
}
