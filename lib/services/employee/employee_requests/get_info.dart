import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/user_employee.dart';

class Info {
  Future<UserEmployee> get({required String token}) async {
    final String baseUrl = AppString.baseUrl;
    final response =
        await Api().get(url: '$baseUrl/employees/get_info', token: token);
    final user = UserEmployee.fromJson(response);
    return user;
  }
}
