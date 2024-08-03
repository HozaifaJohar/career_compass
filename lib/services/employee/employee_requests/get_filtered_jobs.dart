import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/provider/employee/get_filteredjob_employee.dart';
import 'package:provider/provider.dart';

class JobsService {
  final baseUrl = AppString.baseUrl;
  Future<List<JobEmployee>> getJobs({
    int? salary,
    String? gender,
    int? experience,
    String? companyName,
    List<int>? statics,
    List<int>? subCategories,
    List<String>? params,
  }) async {
    if (salary != null) params!.add('salary=$salary');
    if (gender != null && gender.isNotEmpty) {
      params!.add('wanted_gender=$gender');
    }
    if (experience != null) params!.add('experience_years=$experience');
    if (companyName != null && companyName.isNotEmpty) {
      params!.add('company[company_name]=$companyName');
    }
    if (statics != null && statics.isNotEmpty) {
      params!.add('statics=${statics.join(',')}');
    }
    if (subCategories != null && subCategories.isNotEmpty) {
      params!.add('subcategories=${subCategories.join(',')}');
    }
    print('The params is => $params');
    String url = '$baseUrl/employees/jobs';
    if (params!.isNotEmpty) {
      print('hazoof');
      url = '$url?${params.join('&')}';
    }

    final response = await Api().get(
      url: url,
    ) as List;
    final jobs = response.map((e) => JobEmployee.fromJson(e)).toList();
    return jobs;
  }
}
