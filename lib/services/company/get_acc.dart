import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/acc_emp.dart';
import 'package:career_compass/models/applied_emp.dart';

class GetAccepted {
  Future<dynamic> getallApplied(int id) async {
    String token = CashMemory().getCashData(key: 'accessToken');
    final url = AppString.baseUrl;
    var jsonData = await Api()
        .get(url: '$url/company/getAllEmployeeAccepted/$id', token: token);
    print(jsonData);
    print('fff');
    if (jsonData is List) {
      print('JsonData is a List of length: ${jsonData.length}');
      print('First element in the list: ${jsonData[0]}');

      List<AppliedEmployee> employees = jsonData.map((json) {
        print('Parsing JSON: $json'); // Debugging each item
        return AppliedEmployee.fromJson(json);
      }).toList();

      print(
          'Parsed Employees: $employees'); // Should print list of AcceptedEmployee
      return employees;
    } else {
      print('jsonData is not a List: $jsonData');
      return 'no data';
    }
  }
}
