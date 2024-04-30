import 'package:career_compass/screens/auth/login.dart';
import 'package:career_compass/screens/auth/register.dart';
import 'package:flutter/material.dart';

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
      home: RegisterScreen(),
      routes: {
        '/register_screen': (context) => RegisterScreen(),
        '/login_screen': (context) => LoginScreen(),
      },
    );
  }
}
