import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/job_employee.dart';

class JobsService {
  final url = AppString.baseUrl;
  Future<List<JobEmployee>> getJobs() async {
    final response = await Api().get(url: '$url/employees/jobs') as List;
    final jobs = response.map((e) => JobEmployee.fromJson(e)).toList();
    return jobs;
  }
}
