import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';

class RemoveJob {
  String url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<dynamic> removejob(int id) async {
    var res =
        await Api().post(url: '$url/company/inactivateJob/$id', token: token);
    print(res);
    if(res=='job has been unactivated')
    return res;
  }
}
