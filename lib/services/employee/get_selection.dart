import 'package:career_compass/constant/url.dart';
import 'package:career_compass/helper/api.dart';
import 'package:career_compass/models/static.dart';
import 'package:career_compass/models/subcatygory.dart';

class GetStaticForEmmployee {
  String url = AppString.baseUrl;
  Future<Static> getAllStatic() async {
    final response = await Api().get(
      url: '$url/statics',
    );
    print(response);
    return Static.fromJson(response);
  }

  Future<List<Subcategory>> getSubcategory() async {
    String url = AppString.baseUrl;
    List<dynamic> jsonData = await Api().get(url: '$url/sub-categories');
    List<Subcategory> subCategory =
        jsonData.map((json) => Subcategory.fromJson(json)).toList();
    print(jsonData);
    return subCategory;
  }
}
