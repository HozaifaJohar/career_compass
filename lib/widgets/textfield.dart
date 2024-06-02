import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final Color? borderColor;
  final double? border;
  final String? Function(String?)? validator;
  final String validateMessage;

  const CustomTextField({
    this.title,
    this.hint,
    this.controller,
    this.maxLines,
    this.minLines,
    this.borderColor,
    this.border,
    this.validator,
    required this.validateMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(border!),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(border!),
            borderSide: BorderSide(color: borderColor!)),
        labelText: title,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) {
        if (value!.isEmpty) {
          return validateMessage;
        }
        return null;
      },
    );
  }
}
