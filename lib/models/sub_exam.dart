
import 'dart:convert';

List<SubExam> subExamFromJson(String str) => List<SubExam>.from(json.decode(str).map((x) => SubExam.fromJson(x)));

String subExamToJson(List<SubExam> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubExam {
    int id;
    String name;
    dynamic certification;
    bool canApply;

    SubExam({
        required this.id,
        required this.name,
        required this.certification,
        required this.canApply,
    });

    factory SubExam.fromJson(Map<String, dynamic> json) => SubExam(
        id: json["id"],
        name: json["name"],
        certification: json["certification"],
        canApply: json["can_apply"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "certification": certification,
        "can_apply": canApply,
    };
}
