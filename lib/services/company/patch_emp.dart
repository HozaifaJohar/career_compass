import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PatchEmp {
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<bool> patchemp(int id, int jobId) async {
    var res = await http.patch(Uri.parse('$url/company/employeeAcceptance/$id'),
        body: json.encode({"job_id": jobId}),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        });
    print(res.statusCode);
    print(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
