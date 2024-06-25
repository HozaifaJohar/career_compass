import 'dart:io';
import 'dart:ui';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';

class UploadFiles {
  String url = AppString.baseUrl;

  Future uploadImage(
      {required Map<String, String> bodyFields, required String token}) async {
    await Api().post(
        url: '$url/employees/upload-image', body: bodyFields, token: token);
    print('upload files class ${CashMemory().getCashData(key: 'accessToken')}');
  }

  Future uploadCv() async {}
}
