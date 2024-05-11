import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/style/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/wellcome.jpg',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<TypeProvider>(context, listen: false).setType(true);
                Navigator.pushNamed(context, '/login_screen');
              },
              child: Container(
                width: 150,
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
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Provider.of<TypeProvider>(context, listen: false)
                    .setType(false);
                Navigator.pushNamed(context, '/login_screen');
              },
              child: Container(
                width: 150,
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
            )
          ],
        ),
      ),
    );
  }
}
