import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/exam_model.dart';
import 'package:career_compass/provider/employee/register_screen_helper.dart';
import 'package:provider/provider.dart';

class ApplyExam {
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<List<Exam>> applyExam(int id) async {
   
      final body = json.encode({"subcategoryId": id});

      var res = await Api()
          .post(url: '$url/employees/apply_to_exam', body: body, token: token);
      if (res is List) {
        List<Exam> exams = res.map((exam) => Exam.fromJson(exam)).toList();
        return exams;
      } else {
        return [];
      }
    
   
  }
}
