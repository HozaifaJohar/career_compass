import 'package:career_compass/screens/auth/homepage.dart';
import 'package:career_compass/screens/auth/login.dart';
import 'package:career_compass/screens/auth/register.dart';
import 'package:career_compass/screens/auth/start.dart';
import 'package:flutter/material.dart';

import 'screens/auth/splash.dart';

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
      home: const StartScreen(),
      routes: {
        '/register_screen': (context) => const RegisterScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/start_screen':(context)=> const StartScreen(),
        '/splash_screen':(context)=> const SplashScreen(),
        '/home_page':(context) => const HomePage(),
      },
    );
  }
}
