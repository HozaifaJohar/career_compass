import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class ChangePassService {
  String url = AppString.baseUrl;
  Future<int> resendcode(String email, String code, String password) async {
    var data = await Api().post(
      url: '$url/companyAuth/post_new_password',
      body: {"email": email, "activationCode": code, "password": password},
    );
    print(data);
    return data;
  }
}
