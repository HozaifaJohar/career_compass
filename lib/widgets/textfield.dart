import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final Color? borderColor;
  final double? border;
  final String? Function(String?)? validator;
  final String? validateMessage;
  final TextInputType? keyboadType;
  final List<TextInputFormatter>? inputFormate;
  final void Function(String)? onchange;

  const CustomTextField({
    this.title,
    this.hint,
    this.controller,
    this.maxLines,
    this.minLines,
    this.borderColor,
    this.border,
    this.validator,
    this.keyboadType,
    this.inputFormate,
    this.validateMessage,
    this.onchange,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          minLines: minLines,
          keyboardType: keyboadType,
          inputFormatters: inputFormate,
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
          onChanged: onchange,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
