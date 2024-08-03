import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
import 'package:http/http.dart' as http;

class GetImage {
  final reqUrl = 'http://10.0.2.2:3000/employees/get_image';
  String token = CashMemory().getCashData(key: 'accessToken');
  Future<String?> getImage() async {
    var res = await http
        .get(Uri.parse(reqUrl), headers: {'Authorization': 'Bearer $token'});
    print(res);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    } else {
      return null;
    }
  }
}
