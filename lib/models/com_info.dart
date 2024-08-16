
import 'dart:convert';

Information informationFromJson(String str) => Information.fromJson(json.decode(str));

String informationToJson(Information data) => json.encode(data.toJson());

class Information {
    String companyName;
    String email;
    String phone;
    String address;
    String description;
    dynamic logo;
    int premiumLevel;
    int wallet;

    Information({
        required this.companyName,
        required this.email,
        required this.phone,
        required this.address,
        required this.description,
        required this.logo,
        required this.premiumLevel,
        required this.wallet,
    });

    factory Information.fromJson(Map<String, dynamic> json) => Information(
        companyName: json["company_name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        description: json["description"],
        logo: json["logo"],
        premiumLevel: json["premiumLevel"],
        wallet: json["wallet"],
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "email": email,
        "phone": phone,
        "address": address,
        "description": description,
        "logo": logo,
        "premiumLevel": premiumLevel,
        "wallet": wallet,
    };
}
