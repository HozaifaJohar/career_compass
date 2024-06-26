
import 'dart:convert';

List<Qualification> qualificationFromJson(String str) => List<Qualification>.from(json.decode(str).map((x) => Qualification.fromJson(x)));

String qualificationToJson(List<Qualification> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Qualification {
    int id;
    String name;

    Qualification({
        required this.id,
        required this.name,
    });

    factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
