import 'dart:convert';

List<Job> jobFromJson(String str) => List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
    int id;
    String title;
    String description;
    int salary;
    int workHours;
    int experienceYears;
    String wantedGender;
    List<Static> jobStatic;
    List<SubCategory> subCategories;

    Job({
        required this.id,
        required this.title,
        required this.description,
        required this.salary,
        required this.workHours,
        required this.experienceYears,
        required this.wantedGender,
        required this.jobStatic,
        required this.subCategories,
    });

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        salary: json["salary"],
        workHours: json["work_hours"],
        experienceYears: json["experience_years"],
        wantedGender: json["wanted_gender"],
        jobStatic: List<Static>.from(json["static"].map((x) => Static.fromJson(x))),
        subCategories: List<SubCategory>.from(json["subCategories"].map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "salary": salary,
        "work_hours": workHours,
        "experience_years": experienceYears,
        "wanted_gender": wantedGender,
        "static": List<dynamic>.from(jobStatic.map((x) => x.toJson())),
        "subCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    };
}

class Static {
    int id;
    String name;
    String type;

    Static({
        required this.id,
        required this.name,
        required this.type,
    });

    factory Static.fromJson(Map<String, dynamic> json) => Static(
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

class SubCategory {
    int id;
    String name;

    SubCategory({
        required this.id,
        required this.name,
    });

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
