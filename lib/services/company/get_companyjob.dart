import 'dart:convert';
import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/job.dart';

class JobServices {
  String token = CashMemory().getCashData(key: 'accessToken');

  Future<List<Job>> getAllJob() async {
    String url = AppString.baseUrl;
    print(token);
    List<dynamic> jsonData = await Api().get(url: '$url/company', token: token);
    print('1');
    print(jsonData);
    List<Job> jobs = jsonData.map((json) => Job.fromJson(json)).toList();
    //print(jobs);
    if (!jobs.isEmpty) {
      return jsonData.map((json) => Job.fromJson(json)).toList();
    } else
      return [];
  }
}
