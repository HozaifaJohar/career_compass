import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/screens/company_screens/register_company.dart';
import 'package:career_compass/screens/employee_screens/register_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/obsecure_textfield.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RegisterScreen({super.key});

  // String? requiredValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'This field is required';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    bool type = Provider.of<TypeProvider>(context).type;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight / 3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Image.asset(
                'images/logoCompass.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: type ? 'email' : 'Company email',
                      controller: email,
                      maxLines: 1,
                      borderColor: AppColors.amber,
                      border: 50,
                      validateMessage: "Please enter valid email",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ObsecureTextField(
                      isObsecureChar: '.',
                       maxLines: 1,
                        borderColor: AppColors.amber,
                      hint: 'enter your password',
                      validateMessage: 'Please enter a password',
                      suffixIcon: Icon(Icons.visibility),
                      title: 'Password',
                      controller: password,
                      border: 50,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Builder(
                      builder: (context) => GestureDetector(
                        onTap: () {
                          {
                            if (formKey.currentState!.validate()) {
                              if (type) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterEmployeeScreen(
                                    email: email.text,
                                    password: password.text,
                                  );
                                }));
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ResisterCompanyScreen(
                                        email: email.text,
                                        password: password.text,
                                      );
                                    },
                                  ),
                                );
                              }
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
