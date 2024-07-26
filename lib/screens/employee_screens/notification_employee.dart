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
        NotificationCardEmployee(
            tiltle: 'Google Company', subTitle: 'UX/UI Designe'),
      ],
    );
  }
}
