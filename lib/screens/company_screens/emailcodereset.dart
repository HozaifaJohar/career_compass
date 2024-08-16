import 'package:career_compass/screens/company_screens/re_writepass.dart';
import 'package:career_compass/services/company/activateotp_company.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:career_compass/widgets/pin_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CodeRest extends StatefulWidget {
  final String email;
  const CodeRest({super.key, required this.email});

  @override
  State<CodeRest> createState() => _CodeRestState();
}

class _CodeRestState extends State<CodeRest> {
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
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  print(pinCode.text);

                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResetPassword(code: pinCode.text,email: widget.email,);
                  }));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    'Submet',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
