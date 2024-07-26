import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/job_employee.dart';

class AlljobService {
  final baseUrl = AppString.baseUrl;
  Future<List<JobEmployee>> getJobs() async {
    String url = '$baseUrl/employees/jobs';
    final response = await Api().get(
      url: url,
    ) as List;
    final jobs = response.map((e) => JobEmployee.fromJson(e)).toList();
    return jobs;
  }
}
