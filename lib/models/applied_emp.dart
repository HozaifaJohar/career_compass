
import 'dart:convert';

List<AppliedEmployee> appliedEmployeeFromJson(String str) => List<AppliedEmployee>.from(json.decode(str).map((x) => AppliedEmployee.fromJson(x)));

String appliedEmployeeToJson(List<AppliedEmployee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppliedEmployee {
    int id;
    bool accepted;
    Employee employee;
    List<Certification> certifications;

    AppliedEmployee({
        required this.id,
        required this.accepted,
        required this.employee,
        required this.certifications,
    });

    factory AppliedEmployee.fromJson(Map<String, dynamic> json) => AppliedEmployee(
        id: json["id"],
        accepted: json["accepted"],
        employee: Employee.fromJson(json["employee"]),
        certifications: List<Certification>.from(json["certifications"].map((x) => Certification.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accepted": accepted,
        "employee": employee.toJson(),
        "certifications": List<dynamic>.from(certifications.map((x) => x.toJson())),
    };
}

class Certification {
    String name;
    String mark;

    Certification({
        required this.name,
        required this.mark,
    });

    factory Certification.fromJson(Map<String, dynamic> json) => Certification(
        name: json["name"],
        mark: json["mark"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mark": mark,
    };
}

class Employee {
    int id;
    String name;
    String email;
    String phone;
    String homeAddress;
    DateTime birthdayDate;
    bool active;
    String description;
    dynamic image;
    dynamic resume;
    String gender;
    dynamic experience;
    dynamic education;

    Employee({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.homeAddress,
        required this.birthdayDate,
        required this.active,
        required this.description,
        required this.image,
        required this.resume,
        required this.gender,
        required this.experience,
        required this.education,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        homeAddress: json["home_address"],
        birthdayDate: DateTime.parse(json["birthday_date"]),
        active: json["active"],
        description: json["description"],
        image: json["image"],
        resume: json["resume"],
        gender: json["gender"],
        experience: json["experience"],
        education: json["education"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "home_address": homeAddress,
        "birthday_date": "${birthdayDate.year.toString().padLeft(4, '0')}-${birthdayDate.month.toString().padLeft(2, '0')}-${birthdayDate.day.toString().padLeft(2, '0')}",
        "active": active,
        "description": description,
        "image": image,
        "resume": resume,
        "gender": gender,
        "experience": experience,
        "education": education,
    };
}
