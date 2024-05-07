import 'dart:convert';

UserEmployee userFromJson(String str) =>
    UserEmployee.fromJson(json.decode(str));

String userToJson(UserEmployee data) => json.encode(data.toJson());

class UserEmployee {
  final String name;
  final String email;
  final String password;
  final String gender;
  final String phone;

  UserEmployee({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.phone,
  });

  factory UserEmployee.fromJson(Map<String, dynamic> json) => UserEmployee(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "phone": phone,
      };
}
