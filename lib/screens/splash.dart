import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/style/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool provider = Provider.of<TypeProvider>(context, listen: false).type;
    if (CashMemory().getCashData(key: 'accessToken').isEmpty) {
      toStart();
    } else if (provider &&
        CashMemory().getCashData(key: 'accessToken').isNotEmpty) {
      navigateTOEmployee();
    } else {
      navigateTOCompany();
    }
    super.initState();
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

  void navigateTOEmployee() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/home_employee');
    });
  }

  void navigateTOCompany() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/home_company');
    });
  }

  void toStart() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/start_screen');
    });
  }
}
