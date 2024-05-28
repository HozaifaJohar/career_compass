import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textField.dart';
import 'package:flutter/material.dart';

class ChangePasswordEmployee extends StatefulWidget {
  const ChangePasswordEmployee({super.key});

  @override
  State<ChangePasswordEmployee> createState() => _ChangePasswordEmployeeState();
}

class _ChangePasswordEmployeeState extends State<ChangePasswordEmployee> {
  final TextEditingController _changePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'C H A N G E\n P A S S W O R D',
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
            preferredSize: Size.fromHeight(40), child: SizedBox()),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight / 4,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomTextField(
              title: 'Enter New Password',
              maxLines: 1,
              borderColor: AppColors.amber,
              controller: _changePassword,
              border: 10,
              val: (value) {
                if (value!.isEmpty) {
                  return 'pleas enter password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
