import 'package:career_compass/services/company/activateotp_company.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/pin_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtpCompany extends StatelessWidget {
  String email;
  OtpCompany({super.key, required this.email});

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
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  Provider.of<ActivicationCode>(context,listen: false).resendcode(email);
                  //  Navigator.pushNamed(context, '/home_company');
                },
                child: const Text(
                  'resent code?',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<ActivicationCode>(context, listen: false)
                      .activicate(email, pinCode.text);
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
