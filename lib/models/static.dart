
import 'dart:convert';

Static staticFromJson(String str) => Static.fromJson(json.decode(str));

String staticToJson(Static data) => json.encode(data.toJson());

class Static {
    List<Category> levels;
    List<Category> jobTypes;
    List<Category> categories;

    Static({
        required this.levels,
        required this.jobTypes,
        required this.categories,
    });

    factory Static.fromJson(Map<String, dynamic> json) => Static(
        levels: List<Category>.from(json["levels"].map((x) => Category.fromJson(x))),
        jobTypes: List<Category>.from(json["jobTypes"].map((x) => Category.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "levels": List<dynamic>.from(levels.map((x) => x.toJson())),
        "jobTypes": List<dynamic>.from(jobTypes.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String name;
    String type;

    Category({
        required this.id,
        required this.name,
        required this.type,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
    };
}
