import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

Widget NotificationCardCompany({String? tiltle, String? subTitle}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 80,
      width: double.infinity,
      child: Card(
        color: const Color.fromARGB(138, 128, 145, 238),
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(tiltle!),
          subtitle: Text(subTitle!),
          trailing: const Icon(
            Icons.arrow_circle_right,
            color: Color(0xffF68623),
          ),
        ),
      ),
    ),
  );
}
