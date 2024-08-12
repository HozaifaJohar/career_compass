import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/acc_emp.dart';
import 'package:career_compass/models/applied_emp.dart';
import 'package:career_compass/screens/company_screens/accepted.dart';

class GetEmployees {
  String token = CashMemory().getCashData(key: 'accessToken');
  final url = AppString.baseUrl;

  Future<dynamic> getApplied(int id) async {
    var jsonData = await Api()
        .get(url: '$url/company/getAllEmployeeApplying/$id', token: token);
    print(jsonData);
    if (jsonData is List) {
      List<AppliedEmployee> employees =
          jsonData.map((json) => AppliedEmployee.fromJson(json)).toList();
      print(employees);
      return employees;
    } else {
      return 'no data';
    }
  }

  
}
