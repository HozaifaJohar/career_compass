import 'package:flutter/material.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int? maxLines = 1,
  Color? borderColor,
}) {
  return Column(
    children: [
      TextFormField(
        enabled: true,
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: borderColor!)),
          labelText: title,
        ),
      ),
    ],
  );
}
