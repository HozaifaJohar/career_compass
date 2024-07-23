import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/job_employee.dart';

class JobsService {
  final baseUrl = AppString.baseUrl;

  Future<List<JobEmployee>> getJobs({
    int? salary,
    String? gender,
    int? experience,
    String? companyName,
    List<int>? statics,
    List<int>? subCategories,
  }) async {
    final List<String> params = [];
    if (salary != null) params.add('salary=$salary');
    if (gender != null) params.add('wanted_gender=$gender');
    if (experience != null) params.add('experience_years=$experience');
    if (companyName != null) params.add('company[company_name]=$companyName');
    if (statics != null) params.add('statics=${statics.join(',')}');
    if (subCategories != null) {
      params.add('subcategories=${subCategories.join(',')}');
    }
    String url = '$baseUrl/employees/jobs';
    if (params.isNotEmpty) {
      url = '$url?${params.join('&')}';
    }

    final response = await Api().get(
      url: url,
    ) as List;
    final jobs = response.map((e) => JobEmployee.fromJson(e)).toList();
    return jobs;
  }
}
