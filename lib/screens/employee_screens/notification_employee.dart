import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/notificationCard_employee.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';

class NotificationEmployeeScreen extends StatelessWidget {
  const NotificationEmployeeScreen({super.key});
  static const route = 'notification-employee';
  @override
  Widget build(BuildContext context) {
    //final message = ModalRoute.of(context)?.settings.arguments;
    return Column(
      children: [
        NotificationCardEmployee(
            tiltle: 'Google Company', subTitle: 'UX/UI Designe'),
      ],
    );
  }
}
