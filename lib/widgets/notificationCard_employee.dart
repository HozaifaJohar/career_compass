import 'package:flutter/material.dart';

Widget NotificationCardEmployee({String? tiltle, String? subTitle}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 80,
      width: double.infinity,
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.business),
          ),
          title: Text(tiltle!),
          subtitle: Text(subTitle!),
          trailing: const Icon(
            Icons.arrow_circle_right,
            color: const Color(0xffF68623),
          ),
          onTap: () {},
        ),
      ),
    ),
  );
}
