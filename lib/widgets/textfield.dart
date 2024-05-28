import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef StringValidator = String? Function(String?);

// Widget customTextField ({
//   String? title,
//   String? hint,
//   TextEditingController? controller,
//   int? maxLines,
//   int? minLines,
//   Color? borderColor,
//   double? border,
//   StringValidator? val,
// }) {
//   return Column(
//     children: [
//       Form(
//         child: TextFormField(
//           enabled: true,
//           controller: controller,
//           minLines: minLines,
//           maxLines: maxLines,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(border!),
//             ),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(border),
//                 borderSide: BorderSide(color: borderColor!)),
//             labelText: title,
//           ),
//           validator: val,
//         ),
//       ),
//     ],
//   );
// }

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final Color? borderColor;
  final double? border;
  final StringValidator? val;

  const CustomTextField({
    this.title,
    this.hint,
    this.controller,
    this.maxLines,
    this.minLines,
    this.borderColor,
    this.border,
    this.val,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
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
        validator: val,
      ),
    );
  }
}
