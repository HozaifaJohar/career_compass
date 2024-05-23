import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/notificationCard_employee.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';

class NotificationEmployeeScreen extends StatelessWidget {
  const NotificationEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 140,
                  color: AppColors.mainColor,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 120,
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
        NotificationCardEmployee(tiltle: 'Google Company',subTitle: 'UX/UI Designe'),
      ],
    );
  }
}
