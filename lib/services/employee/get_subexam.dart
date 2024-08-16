import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/sub_exam.dart';

class GetSubExams {
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<List<SubExam>> getExamState() async {
    List<dynamic> jsonData =
        await Api().get(url: '$url/employees/get_subcategories', token: token);
    print(jsonData);
    List<SubExam> subCategory =
        jsonData.map((json) => SubExam.fromJson(json)).toList();
    return subCategory;
  }
}
