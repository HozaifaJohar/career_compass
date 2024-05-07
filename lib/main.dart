import 'package:career_compass/screens/employee_screens/employee_information.dart';
import 'package:career_compass/screens/employee_screens/home_employee.dart';
import 'package:career_compass/screens/employee_screens/register_employee.dart';
import 'package:career_compass/screens/login.dart';
import 'package:career_compass/screens/company_screens/home_company.dart';
import 'package:career_compass/screens/company_screens/register_company.dart';
import 'package:career_compass/screens/register.dart';
import 'package:career_compass/screens/start.dart';
import 'package:flutter/material.dart';

import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: StartScreen(),
      routes: {
        '/start_screen': (context) => const StartScreen(),
        'register_screen': (context) => const RegisterScreen(),
        '/login_screen': (context) => const LoginScreen(),
        //'/splash_screen': (context) => const SplashScreen(),
        '/register_company': (context) => ResisterCompanyScreen(),
        '/home_company': (context) => const HomePageCompany(),

        '/register_employee': (context) => const RegisterEmployeeScreen(),
        '/home_employee': (context) => const HomePageEmployee(),
        '/scientific_information': (context) => const ScientificInformation(),
      },
    );
  }
}
