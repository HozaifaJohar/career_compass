import 'dart:convert';

List<JobEmployee> jobEmployeeFromJson(String str) => List<JobEmployee>.from(
    json.decode(str).map((x) => JobEmployee.fromJson(x)));

String jobEmployeeToJson(List<JobEmployee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobEmployee {
  int id;
  String title;
  String description;
  int salary;
  int workHours;
  int numberOfEmployees;
  int experienceYears;
  String wantedGender;
  bool active;
  Company company;
  List<Static> statics;
  List<SubCategory> subCategories;

  JobEmployee({
    required this.id,
    required this.title,
    required this.description,
    required this.salary,
    required this.workHours,
    required this.numberOfEmployees,
    required this.experienceYears,
    required this.wantedGender,
    required this.active,
    required this.company,
    required this.statics,
    required this.subCategories,
  });

  factory JobEmployee.fromJson(Map<String, dynamic> json) => JobEmployee(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        salary: json["salary"],
        workHours: json["work_hours"],
        numberOfEmployees: json["number_of_employees"],
        experienceYears: json["experience_years"],
        wantedGender: json["wanted_gender"],
        active: json["active"],
        company: Company.fromJson(json["company"]),
        statics:
            List<Static>.from(json["static"].map((x) => Static.fromJson(x))),
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "salary": salary,
        "work_hours": workHours,
        "number_of_employees": numberOfEmployees,
        "experience_years": experienceYears,
        "wanted_gender": wantedGender,
        "active": active,
        "company": company.toJson(),
        "static": List<dynamic>.from(statics.map((x) => x.toJson())),
        "subCategories":
            List<dynamic>.from(subCategories.map((x) => x.toJson())),
      };
}

class Company {
  int id;
  String companyName;
  String email;
  String phone;
  String hashedPassword;
  String hashedRt;
  String hashedCode;
  String address;
  String description;
  dynamic logo;
  int premiumLevel;
  int wallet;
  bool active;

  Company({
    required this.id,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.hashedPassword,
    required this.hashedRt,
    required this.hashedCode,
    required this.address,
    required this.description,
    required this.logo,
    required this.premiumLevel,
    required this.wallet,
    required this.active,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        companyName: json["company_name"],
        email: json["email"],
        phone: json["phone"],
        hashedPassword: json["hashed_password"],
        hashedRt: json["hashedRT"],
        hashedCode: json["hashedCode"],
        address: json["address"],
        description: json["description"],
        logo: json["logo"],
        premiumLevel: json["premiumLevel"],
        wallet: json["wallet"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "email": email,
        "phone": phone,
        "hashed_password": hashedPassword,
        "hashedRT": hashedRt,
        "hashedCode": hashedCode,
        "address": address,
        "description": description,
        "logo": logo,
        "premiumLevel": premiumLevel,
        "wallet": wallet,
        "active": active,
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
