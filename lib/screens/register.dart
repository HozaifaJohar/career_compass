import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/screens/company_screens/register_company.dart';
import 'package:career_compass/screens/employee_screens/register_employee.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
//  void _navigate(bool type){
//   if(type==true){
//     RegisterEmployeeScreen(email: _email,)
//   }

//  }
  @override
  Widget build(BuildContext context) {
    bool type = Provider.of<TypeProvider>(context).type;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();

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
                    //@ _@ how to use mediaquery
                    const SizedBox(
                      height: 75,
                    ),
                    // customTextField(
                    //     title: 'Company Name',
                    //     hint: 'Enter the name',
                    //     controller: companyname,
                    //     maxLines: 1,
                    //     borderColor: AppColors.amber,
                    //     border: 50),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: type ? 'email' : 'Company email',
                      // hint: 'Enter the email',
                      controller: email,
                      maxLines: 1,
                      borderColor: AppColors.amber,
                      border: 50,
                      val: (value) {
                        if (value!.length < 3) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      title: 'Password',
                      hint: 'Enter the password',
                      controller: password,
                      maxLines: 1,
                      borderColor: AppColors.amber,
                      border: 50,
                      val: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ResisterCompanyScreen();
                              }));
                            }
                          }
                          return;
                          // Navigator.pushNamed(context,
                          //     type ? '/register_employee' : '/register_company');
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
