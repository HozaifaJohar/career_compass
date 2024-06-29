import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';

class SetStatics {
  String url = AppString.baseUrl;

  Future postStatics({
    required List<Map<String, String>> allCategories,
    required String accessToken,
  }) async {
    var response = await Api().post(
      url: '$url/employees/set_statics',
      body: allCategories,
      token: accessToken,
    );
    print('////hiii iam here////');
  }
}
