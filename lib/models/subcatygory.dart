import 'dart:convert';
import 'package:career_compass/models/static.dart';

List<Subcategory> subcategoryFromJson(String str) => List<Subcategory>.from(
    json.decode(str).map((x) => Subcategory.fromJson(x)));

String subcategoryToJson(List<Subcategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subcategory {
  int id;
  String name;
  Category category;

  Subcategory({
    required this.id,
    required this.name,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category.toJson(),
      };
}

// class Category {
//     int id;
//     String name;
//     String type;

//     Category({
//         required this.id,
//         required this.name,
//         required this.type,
//     });

//     factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: json["name"],
//         type: json["type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "type": type,
//     };
// }
