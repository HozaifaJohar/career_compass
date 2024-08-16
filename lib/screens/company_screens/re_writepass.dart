import 'package:career_compass/services/company/resend_pass.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:career_compass/widgets/obsecure_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  final String code;
  const ResetPassword({super.key, required this.email, required this.code});

  @override
  Widget build(BuildContext context) {
    TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          bottomRight: Radius.circular(90),
        )),
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(65), child: SizedBox()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              ObsecureTextField(
                isObsecureChar: '.',
                maxLines: 1,
                borderColor: AppColors.amber,
                hint: 'enter your password',
                validateMessage: 'Please enter a password',
                suffixIcon: const Icon(Icons.visibility),
                title: 'Password',
                controller: password,
                border: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    print(code);
                    var res = await ChangePassService()
                        .resendcode(email, code, password.text);
                    print(res);
                    if (res == 'password updated successfully') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          elevation: 0,
                          content: FlashMessage(
                            errorText: 'assword updated successfully',
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                        ),
                      );
                    }

                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return CodeRest(
                    //     email: _email.text,
                    //   );
                    // }
                    // )
                    // );
                  },
                  child: const Text('Send'))
            ],
          ),
        ),
      ),
    );
  }
}
