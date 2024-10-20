import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    double customOpacity = 0;
    return Scaffold(
      // backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Wellcome! Get start with your App ',
              style: TextStyle(
                color: Color.fromARGB(255, 36, 83, 154),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 50, end: 200),
              builder: (context, value, child) {
                return Image.asset(
                  'images/manb.gif',
                  height: value * 2,
                  // width: 200,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 50, end: 150),
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    Provider.of<TypeProvider>(context, listen: false)
                        .setType(true);
                    CashMemory().insertTypeToCash(key: 'type', value: 'emp');
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  child: Container(
                    width: value,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    child: const Center(
                        child: Text(
                      'Employee',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TweenAnimationBuilder(
              curve: Curves.bounceOut,
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 50, end: 150),
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    Provider.of<TypeProvider>(context, listen: false)
                        .setType(false);
                        CashMemory().insertTypeToCash(key: 'type', value: 'com');
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  child: Container(
                    width: value,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    child: const Center(
                        child: Text(
                      'Company',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
