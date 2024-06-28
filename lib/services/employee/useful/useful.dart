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
    Static statics = Static.fromJson(response);
    return statics;
  }

  Future<List<Qualification>> getThierSubCategory(String categories) async {
    String url = AppString.baseUrl;

    List<dynamic> jsonData = await Api().get(
        url: '$url/statics/get_their_subcategories?categories=$categories');
    List<Qualification> subCategories =
        jsonData.map((item) => Qualification.fromJson(item)).toList();
    // this line of code takes a list of JSON objects (jsonData), converts each JSON
    // object into a Qualification object using the Qualification.fromJson constructor, and then
    // collects these Qualification objects into a List which is assigned to the variable
    // subCategories.
    print(jsonData);
    return subCategories;
  }
}
