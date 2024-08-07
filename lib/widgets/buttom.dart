import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

Widget customButton({
  VoidCallback? tap,
  bool? status = false,
  String? text = 'Save',
  BuildContext? context,
  double? width
}) {


  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
    
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.mainColor,
          const Color.fromARGB(255, 67, 87, 202),
          // Color(0xFF00b4db), // First color
          // Color(0xFF00b3b0),
        ]),
        borderRadius: BorderRadius.circular(8),
      ),
      width: width,
      child: Text(
        status == false ? text! : 'Please wait...',
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}
