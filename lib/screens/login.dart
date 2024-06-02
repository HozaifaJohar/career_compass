import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool type = Provider.of<TypeProvider>(context).type;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            height: 400,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
              child: Column(
                children: [
                  CustomTextField(
                    title: type ? 'email' : 'company email',
                    hint: 'enter your email',
                    controller: email,
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    border: 50,
                    validateMessage: 'please enter valid email',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    title: 'password',
                    hint: 'enter your password',
                    controller: password,
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    border: 50,
                    validateMessage: 'please enter valid password ',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('OR'),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      )),
                      SizedBox(
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register_screen');
                    },
                    child: const Text('Create Account'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          type
                              ? '/navigation_employee'
                              : '/navigation_company');
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: 140,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[350],
              child: const Icon(Icons.person_2_sharp),
            ),
          )
        ]),
      ),
    );
  }
}
