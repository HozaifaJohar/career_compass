
import 'dart:convert';

List<AppliedEmployee> appliedEmployeeFromJson(String str) => List<AppliedEmployee>.from(json.decode(str).map((x) => AppliedEmployee.fromJson(x)));

String appliedEmployeeToJson(List<AppliedEmployee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppliedEmployee {
    int id;
    bool accepted;
    Employee employee;
    Job job;

    AppliedEmployee({
        required this.id,
        required this.accepted,
        required this.employee,
        required this.job,
    });

    factory AppliedEmployee.fromJson(Map<String, dynamic> json) => AppliedEmployee(
        id: json["id"],
        accepted: json["accepted"],
        employee: Employee.fromJson(json["employee"]),
        job: Job.fromJson(json["job"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accepted": accepted,
        "employee": employee.toJson(),
        "job": job.toJson(),
    };
}

class Employee {
    int id;
    String name;
    String email;
    String phone;
    String homeAddress;
    DateTime birthdayDate;
    String hashedPassword;
    String hashedRt;
    bool active;
    String hashedCode;
    String description;
    String image;
    String resume;
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
        required this.hashedPassword,
        required this.hashedRt,
        required this.active,
        required this.hashedCode,
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
        hashedPassword: json["hashed_password"],
        hashedRt: json["hashedRT"],
        active: json["active"],
        hashedCode: json["hashedCode"],
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
        "hashed_password": hashedPassword,
        "hashedRT": hashedRt,
        "active": active,
        "hashedCode": hashedCode,
        "description": description,
        "image": image,
        "resume": resume,
        "gender": gender,
        "experience": experience,
        "education": education,
    };
}

class Job {
    int id;
    String title;
    String description;
    int salary;
    int workHours;
    int numberOfEmployees;
    int experienceYears;
    String wantedGender;
    bool active;

    Job({
        required this.id,
        required this.title,
        required this.description,
        required this.salary,
        required this.workHours,
        required this.numberOfEmployees,
        required this.experienceYears,
        required this.wantedGender,
        required this.active,
    });

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        salary: json["salary"],
        workHours: json["work_hours"],
        numberOfEmployees: json["number_of_employees"],
        experienceYears: json["experience_years"],
        wantedGender: json["wanted_gender"],
        active: json["active"],
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
    };
}
