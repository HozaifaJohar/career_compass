import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        centerTitle: true,
        title: Image.asset(
          'images/logoCompass.jpg',
          height: 500,
          width: 400,
          fit: BoxFit.fitHeight,
        ),
        backgroundColor: AppColors.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      //  ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 110,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
              ),
              SizedBox(
                width: 60,
              ),
              Container(
                height: 110,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
              ),
            ],
          ),
          Text('dd'),
          Text('data'),
          Text('data'),
          ElevatedButton(onPressed: () {}, child: Text('register'))
        ],
      ),
    );
  }
}
