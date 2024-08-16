import 'package:career_compass/services/company/update_info.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditInformation extends StatefulWidget {
  const EditInformation({
    super.key,
  });

  @override
  State<EditInformation> createState() => _EditInformationState();
}

class _EditInformationState extends State<EditInformation> {
  final TextEditingController name = TextEditingController();

  final TextEditingController phone = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Information',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.mainColor,
              Color.fromARGB(255, 67, 87, 202),
            ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                title: 'company phone',
                hint: 'enter your email',
                controller: phone,
                maxLines: 1,
                borderColor: AppColors.amber,
                border: 50,
                validateMessage: 'please enter valid phone',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'company name',
                hint: 'enter your name',
                controller: name,
                maxLines: 1,
                borderColor: AppColors.amber,
                border: 50,
                validateMessage: 'please enter valid name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'company address',
                hint: 'enter your address',
                controller: address,
                maxLines: 1,
                borderColor: AppColors.amber,
                border: 50,
                validateMessage: 'please enter valid address',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Description',
                hint: 'enter your description',
                controller: desc,
                maxLines: 3,
                borderColor: AppColors.amber,
                border: 10,
                validateMessage: 'please enter valid desc',
              ),
              customButton(
                  tap: () async {
                    var res = await Update().updateInf(
                        name.text, phone.text, address.text, desc.text);
                  },
                  text: 'Edit',
                  context: context,
                  width: 100)
            ],
          ),
        ),
      ),
    );
  }
}
