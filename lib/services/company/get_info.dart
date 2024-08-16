import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/com_info.dart';

class GetInfCompany {
  final url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<Information> getInfCompany() async {
    var res =
        await Api().get(url: '$url/company/get_info_company', token: token);
    print(res);
    return Information.fromJson(res);
  }
}
