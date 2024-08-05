import 'package:career_compass/services/employee/employee_auth/activation_employee.dart';
import 'package:career_compass/services/employee/employee_auth/resendCode_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:career_compass/widgets/pin_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OtpEmployee extends StatelessWidget {
  final String email;
  OtpEmployee({required this.email, super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController pinCode = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'V E R I F Y',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
            bottomRight: Radius.circular(90),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: SizedBox(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  "Verification",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  child: const Text(
                    "Enter the code sent to your email",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
                CustomPinCode(
                  pinPutController: pinCode,
                  length: 6,
                  onCompleted: (pin) {
                    debugPrint(pin);
                  },
                  validateMessage: 'invalid code please enter full code',
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Provider.of<ResendCodeEmployeeService>(context,
                            listen: false)
                        .returnNewCode(
                      email: email,
                    );
                  },
                  child: const Text(
                    'resend code?',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var isActive = await Provider.of<
                              ActivationEmployeeService>(context, listen: false)
                          .returnAccessToken(email: email, code: pinCode.text);
                      if (isActive == 'error') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 0,
                            content: FlashMessage(
                              errorText:
                                  "error code, please press resend code.",
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      } else {
                        Navigator.pushNamed(context, '/scientific_information');
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
