import 'package:flutter/material.dart';

Widget customTextField({
  String? title,
  String? hint,
  TextEditingController? controller,
  int? maxLines,
  int? minLines,
  Color? borderColor,
  double? border,
}) {
  return Column(
    children: [
      TextFormField(
        enabled: true,
        controller: controller,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(border!),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border),
              borderSide: BorderSide(color: borderColor!)),
          labelText: title,
        ),
      ),
    ],
  );
}
