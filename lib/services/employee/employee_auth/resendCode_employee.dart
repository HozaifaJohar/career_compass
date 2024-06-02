import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResendCodeEmployeeService with ChangeNotifier {
  String url = AppString.baseUrl;

  Future<int> returnNewCode({required String email}) async {
    int code = await Api().post(
      url: '$url/employeeAuth/requestActivationCode',
      body: {
        "email": email,
      },
    );
    return code;
  }
}
