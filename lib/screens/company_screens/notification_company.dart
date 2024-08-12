import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/notificationCard_company.dart.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';

class NotificationCompanyScreen extends StatelessWidget {
  const NotificationCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationCardCompany(tiltle: 'Marah', ),
      ],
    );
  }
}
