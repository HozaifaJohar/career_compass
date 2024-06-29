import 'package:flutter/material.dart';

class ObsecureTextField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final String? isObsecureChar;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixIcon;
  final Color? borderColor;
  final double? border;
  final String? Function(String?)? validator;
  final String validateMessage;

  const ObsecureTextField({
    required this.isObsecureChar,
    this.suffixIcon,
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
  _ObsecureTextFieldState createState() => _ObsecureTextFieldState();
}

class _ObsecureTextFieldState extends State<ObsecureTextField> {
  bool _isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObsecure,
      obscuringCharacter: widget.isObsecureChar!,
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObsecure = !_isObsecure;
            });
          },
          icon: widget.suffixIcon!,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.border!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.border!),
          borderSide: BorderSide(color: widget.borderColor!),
        ),
        labelText: widget.title,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) {
        if (value!.isEmpty) {
          return widget.validateMessage;
        }
        return null;
      },
    );
  }
}
