import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/helper/api.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ResumService {
  String url = AppString.baseUrl;
  String token = CashMemory().getCashData(key: 'accessToken');
  // Future<String> loadPdf() async {
  //   var res = await http.get('url');
  //   var dir = await getTemporaryDirectory();
  //   File file = new File(dir.path + "/data.pdf");
    
  // }
}
