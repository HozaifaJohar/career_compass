import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/employee/job_employee.dart';

class JobsService {
  final url = AppString.baseUrl;
  Future<List<JobEmployee>> getJobs() async {
    final response = await Api().get(url: '$url/employees/jobs') as List;
    final jobs = response.map(
      (e) {
        print('getjobis founded');
        return JobEmployee(
          id: e["id"],
          title: e["title"],
          description: e["description"],
          salary: e["salary"],
          workHours: e["workHours"],
          numberOfEmployees: e["numberOfEmployees"],
          experienceYears: e["experienceYears"],
          wantedGender: e["wantedGender"],
          active: e["active"],
          company: e["company"],
          statics: e["static"],
          subCategories: e["subCategories"],
        );
      },
    ).toList();
    return jobs;
  }
}
