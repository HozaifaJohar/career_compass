// /employees/primal-filter
import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/job_employee.dart';

class PrimalService {
  final baseUrl = AppString.baseUrl;
  final token = CashMemory().getCashData(key: 'accessToken');
  Future<List<JobEmployee>> getPrimal() async {
    String url = '$baseUrl/employees/primal-filter';
    final response = await Api().get(url: url, token: token) as List;
    final jobs = response.map((e) => JobEmployee.fromJson(e)).toList();
    return jobs;
  }
}
