import 'package:career_compass/provider/type_provider.dart';
import 'package:career_compass/screens/register.dart';
import 'package:career_compass/services/company/auth_company.dart';
import 'package:career_compass/services/employee/employee_auth/login_employee_service.dart';
import 'package:career_compass/style/theme/text_style.dart';
import 'package:career_compass/style/theme/them.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  BuildContext? waitingDialogOfContext;
  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  Widget build(BuildContext context) {
    bool type = Provider.of<TypeProvider>(context).type;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          FlutterLogin(
            hideForgotPasswordButton: true,
            theme: Thema.loginTheme,
            userType: LoginUserType.email,
            logo: AssetImage(
              'images/hozifa2.png',
            ),
            //'images/logoCompass.jpg',
            // messages: LoginMessages(
            //   userHint: Localization.of(context).getTranslatedValue("Username"),
            //   passwordHint:
            //       Localization.of(context).getTranslatedValue("Password"),
            //   loginButton: Localization.of(context).getTranslatedValue("login"),
            // ),
            onLogin: (data) async {
              print(data.name);
              print(data.password);
              if (type) {
                var isActive = await Provider.of<LogInEmployeeService>(context,
                        listen: false)
                    .returnAccessToken(
                        email: data.name, password: data.password);
                if (isActive == 'error') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      elevation: 0,
                      content: FlashMessage(
                        errorText: "incorrect email or password",
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  Navigator.pushReplacementNamed(
                      context, '/navigation_employee');
                }
              } else if (!type) {
                var auth =
                    await Provider.of<AuthCompany>(context, listen: false)
                        .login(data.name, data.password, context);
                var mass =
                    Provider.of<AuthCompany>(context, listen: false).resMessage;
                if (auth == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      content: FlashMessage(
                        errorText: mass,
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  Navigator.pushReplacementNamed(
                      context, '/navigation_company');
                }

                // if(active !=null){
                //    Navigator.pushNamed(context, '/navigation_company');
                // }
              }
            },
            // (data) async {
            //   var message = "";
            //   try {
            //     message =
            //         await AuthApi.apiClient.login(data.name, data.password);
            //   } catch (e) {
            //     message = e.toString();
            //   }
            //   if (message == "success") {
            //     MyToast.show(
            //       context: context,
            //       text: Localization.of(context)
            //           .getTranslatedValue("login_success"),
            //       toastState: ToastState.SUCCESS,
            //     );
            //     final prefs = await SharedPreferences.getInstance();
            //     final String? token = prefs.getString('token');
            //     bool navToHome = token != null && token.isNotEmpty;

            //     if (navToHome) {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) =>
            //               DefaultBottomBarController(child: HomeScreen()),
            //         ),
            //       );
            //     }
            //   } else {
            //     if (message == "user name or password is incorrect") {
            //       message = "user_name_or_password_is_incorrect";
            //     }
            //     MyToast.show(
            //       context: context,
            //       text: Localization.of(context).getTranslatedValue(message),
            //       toastState: ToastState.ERROR,
            //     );
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => LoginScreen()),
            //     );
            //   }
            // },

            // hideForgotPasswordButton: true,

            //loginAfterSignUp: false,

            // passwordValidator: (value) {
            //   if (value == "" || value == null) {
            //     return Localization.of(context)
            //         .getTranslatedValue("password_required");
            //   } else if (value.length < 8) {
            //     return Localization.of(context).getTranslatedValue(
            //         "number_of_characters_in_the_password_must_be_greater_than");
            //   }
            //   return null;
            // },
            // userValidator: (value) {
            //   if (value == "" || value == null) {
            //     return Localization.of(context)
            //         .getTranslatedValue("user_name_required");
            //   }
            //   return null;
            // },

            onSubmitAnimationCompleted: () {},

            onRecoverPassword: (String) {},
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    "dont have account? ",
                    style: body(16),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return RegisterScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "create join request",
                      style: body(16).copyWith(
                        color: Thema.primaryColor,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



// import 'package:career_compass/provider/type_provider.dart';
// import 'package:career_compass/screens/company_screens/nav_company_screens.dart';
// import 'package:career_compass/screens/employee_screens/nav_employee_screen.dart';
// import 'package:career_compass/services/company/auth_company.dart';
// import 'package:career_compass/services/employee/employee_auth/login_employee_service.dart';
// import 'package:career_compass/style/app_colors.dart';
// import 'package:career_compass/widgets/flash_message.dart';
// import 'package:career_compass/widgets/obsecure_textfield.dart';
// import 'package:career_compass/widgets/textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     bool type = Provider.of<TypeProvider>(context).type;
//     TextEditingController email = TextEditingController();
//     TextEditingController password = TextEditingController();
//     return Scaffold(
//       backgroundColor: AppColors.mainColor,
//       body: Center(
//         child: Stack(clipBehavior: Clip.none, children: [
//           Container(
//             height: 405,
//             width: 350,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Colors.grey[300],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     CustomTextField(
//                       title: type ? 'email' : 'company email',
//                       hint: 'enter your email',
//                       controller: email,
//                       maxLines: 1,
//                       borderColor: AppColors.amber,
//                       border: 50,
//                       validateMessage: 'please enter valid email',
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     ObsecureTextField(
//                       isObsecureChar: '.',
//                       maxLines: 1,
//                       borderColor: AppColors.amber,
//                       hint: 'enter your password',
//                       validateMessage: 'Please enter a password',
//                       suffixIcon: const Icon(Icons.visibility),
//                       title: 'Password',
//                       controller: password,
//                       border: 50,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Row(
//                       children: [
//                         SizedBox(
//                           width: 50,
//                         ),
//                         Expanded(
//                             child: Divider(
//                           thickness: 2,
//                           color: Colors.black,
//                         )),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           child: Text('OR'),
//                         ),
//                         Expanded(
//                             child: Divider(
//                           thickness: 2,
//                           color: Colors.black,
//                         )),
//                         SizedBox(
//                           width: 50,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     MaterialButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, 'register_screen');
//                       },
//                       child: const Text('Create Account'),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () async {
//                         if (_formKey.currentState!.validate()) {
//                           if (type) {
//                             var isActive =
//                                 await Provider.of<LogInEmployeeService>(context,
//                                         listen: false)
//                                     .returnAccessToken(
//                                         email: email.text,
//                                         password: password.text);
//                             if (isActive == 'error') {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   elevation: 0,
//                                   content: FlashMessage(
//                                     errorText: "incorrect email or password",
//                                   ),
//                                   behavior: SnackBarBehavior.floating,
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                               );
//                             } else {
//                               Navigator.pushReplacementNamed(
//                                   context, '/navigation_employee');
//                             }
//                           } else if (!type) {
//                             var auth = await Provider.of<AuthCompany>(context,
//                                     listen: false)
//                                 .login(email.text, password.text, context);
//                             var mass =
//                                 Provider.of<AuthCompany>(context, listen: false)
//                                     .resMessage;
//                             if (auth == false) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   elevation: 0,
//                                   content: FlashMessage(
//                                     errorText: mass,
//                                   ),
//                                   behavior: SnackBarBehavior.floating,
//                                   backgroundColor: Colors.transparent,
//                                 ),
//                               );
//                             } else {
//                               Navigator.pushReplacementNamed(
//                                   context, '/navigation_company');
//                             }

//                             // if(active !=null){
//                             //    Navigator.pushNamed(context, '/navigation_company');
//                             // }
//                           }
//                         }
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 150,
//                         decoration: BoxDecoration(
//                             color: AppColors.mainColor,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Center(
//                           child: Text('Login'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: -50,
//             right: 140,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey[300],
//               child: const Icon(Icons.person_2_sharp),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
