import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PatchEmp extends ChangeNotifier {
  String url = AppString.baseUrl;
  String _resMessage = '';
  String get resMessage => _resMessage;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<bool> patchemp(int id, int jobId) async {
    var res = await http.patch(Uri.parse('$url/company/employeeAcceptance/$id'),
        body: json.encode({"job_id": jobId}),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        });
    var mas = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      _resMessage = 'accepted successfully';
      notifyListeners();
      return true;
    } else if (res.statusCode == 500 || res.statusCode == 404) {
      print('${res.body}mmm');
      _resMessage = mas['message'];
      notifyListeners();
      print(_resMessage);
      return false;
    } else if (res.statusCode == 400) {
      _resMessage = 'The number of employees limited';
      notifyListeners();
      return false;
    } else {
      return false;
    }
  }
}
