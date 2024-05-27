
import 'dart:convert';

UserEmployee userEmployeeFromJson(String str) => UserEmployee.fromJson(json.decode(str));

String userEmployeeToJson(UserEmployee data) => json.encode(data.toJson());

class UserEmployee {
    String name;
    String email;
    String password;
    String gender;
    String phone;
    String homeAddress;
    String birthdayDate;

    UserEmployee({
        required this.name,
        required this.email,
        required this.password,
        required this.gender,
        required this.phone,
        required this.homeAddress,
        required this.birthdayDate,
    });

    factory UserEmployee.fromJson(Map<String, dynamic> json) => UserEmployee(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        phone: json["phone"],
        homeAddress: json["home_address"],
        birthdayDate: json["birthday_date"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "phone": phone,
        "home_address": homeAddress,
        "birthday_date": birthdayDate,
    };
}
