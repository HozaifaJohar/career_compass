import 'package:career_compass/screens/start.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool type = StartScreen.type;
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController companyname = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 250,
        flexibleSpace: Image.asset(
          'images/logoCompass.jpg',
          fit: BoxFit.cover,
        ),
        backgroundColor: AppColors.mainColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //@ _@ how to use mediaquery
              const SizedBox(
                height: 75,
              ),
              // customTextField(
              //     title: 'Company Name',
              //     hint: 'Enter the name',
              //     controller: companyname,
              //     maxLines: 1,
              //     borderColor: AppColors.amber),

              customTextField(
                  title: type ? 'email' : 'Company email',
                  hint: 'Enter the email',
                  controller: email,
                  maxLines: 1,
                  borderColor: AppColors.amber,border: 50),
              const SizedBox(
                height: 20,
              ),
              customTextField(
                  title: 'Password',
                  hint: 'Enter the password',
                  controller: password,
                  maxLines: 1,
                  borderColor: AppColors.amber,border: 50),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/splash_screen');
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
