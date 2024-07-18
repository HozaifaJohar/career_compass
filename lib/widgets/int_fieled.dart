import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegerTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final FocusNode? focusNode;
  final Function(int?)? onChanged;

  const IntegerTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      onChanged: (value) {
        int? intValue = int.tryParse(value);
        onChanged?.call(intValue);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.amber)),
          labelText: 'salary'),
    );
  }
}
