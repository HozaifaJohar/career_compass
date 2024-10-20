import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/screens/company_screens/nav_company_screens.dart';
import 'package:career_compass/screens/employee_screens/nav_employee_screen.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/style/app_colors.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String token = CashMemory().getCashData(key: 'accessToken');
  String type = CashMemory().getTypeFromCash(key: 'type');
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Image.asset('images/logoCompass.jpg'),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 5), () {
      if (token != '') {
        if (type == 'emp') {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const NavigationEmployeeScreen();
          }));
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return const NavigationCompanyScreen();
            }),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const StartScreen();
          }),
        );
      }
    });
  }
}
