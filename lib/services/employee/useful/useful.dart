import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/qual.dart';
import 'package:career_compass/models/static.dart';

class UseFul {
  String url = AppString.baseUrl;
  Future<Static> getAllStatic() async {
    final response = await Api().get(
      url: '$url/statics',
    );
    print(response);
    return Static.fromJson(response);
  }

  Future<List<Qualification>> getThierSubCategory(String categories) async {
    String url = AppString.baseUrl;

    List<dynamic> jsonData = await Api().get(
        url: '$url/statics/get_their_subcategories?categories=$categories');
    List<Qualification> subCategory =
        jsonData.map((json) => Qualification.fromJson(json)).toList();
    print(jsonData);
    return subCategory;
  }
}
