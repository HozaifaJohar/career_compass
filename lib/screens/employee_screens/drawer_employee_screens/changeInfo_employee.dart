import 'package:career_compass/models/user_employee.dart';
import 'package:career_compass/services/employee/employee_requests/get_info.dart';
import 'package:career_compass/services/employee/employee_requests/update_info.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/flash_message.dart';

import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ChangeInformationEmployee extends StatefulWidget {
  const ChangeInformationEmployee({super.key});

  @override
  State<ChangeInformationEmployee> createState() =>
      _ChangeInformationEmployeeState();
}

class _ChangeInformationEmployeeState extends State<ChangeInformationEmployee> {
  _ChangeInformationEmployeeState() {
    //selectedCity = city[0];
    //selectedgender = gender[1];
    //selectedNationality = nationality[0];
  }
  late Future<UserEmployee> futureUser;
  UserEmployee? user;
  List<String> gender = ['male', 'female'];
  String? selectedgender;
  //final city = ['Damascus', 'Hama', 'Homs', 'Aleppo', 'Daraa'];
  //String selectedCity = "";
  //final nationality = ['Syrian', 'Indian'];
  //String selectedNationality = "";
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _name = TextEditingController();
  //final TextEditingController _lastname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  void initState() {
    futureUser = Info().get(
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6ImltYWQiLCJlbWFpbCI6ImltYWRmZmZmQGdtYWlsLmNvbSIsImdlbmRlciI6Im1hbGUiLCJpYXQiOjE3MjI3NTg3NDAsImV4cCI6MTcyMzM2MzU0MH0.NXQXnJO3clVzL8qswvoAhLcmAgAN5yV23g_HL6LV0ZU',
    );
    futureUser.then((userData) {
      setState(() {
        user = userData;
        _name.text = user!.name;
        _address.text = user!.homeAddress;
        _phone.text = user!.phone;
        _birthday.text = user!.birthdayDate;
        selectedgender = user!.gender;
        print(selectedgender);
      });
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: AppColors.mainColor,
          title: const Text(
            'E D I T\n I N F O R M A T I O N',
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
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    title: 'Full Name',
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    controller: _name,
                    border: 10,
                    validateMessage: 'please enter your name ',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    title: 'Home Address',
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    controller: _address,
                    border: 10,
                    validateMessage: 'please enter your home address',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    title: 'Mobile Phone',
                    // hint: 'Type Here please',
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    controller: _phone,
                    border: 10,
                    validateMessage: 'please enter your mobile phone ',
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: DropdownButton(
                  //     isExpanded: true,
                  //     value: selectedCity,
                  //     items: city
                  //         .map((e) => DropdownMenuItem(
                  //               value: e,
                  //               child: Text(e),
                  //             ))
                  //         .toList(),
                  //     onChanged: (val) {
                  //       setState(() {
                  //         selectedCity = val as String;
                  //       });
                  //     },
                  //     icon: const Icon(Icons.arrow_drop_down_circle),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _birthday,
                    decoration: const InputDecoration(
                        labelText: 'Birthday',
                        filled: true,
                        prefixIcon: Icon(Icons.calendar_today),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.amber))),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Gender
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(
                      isExpanded: true,
                      value: selectedgender,
                      items: gender
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedgender = val;
                        });
                      },
                      icon: const Icon(Icons.person_rounded),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Container(
                  //   margin: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: DropdownButton(
                  //     isExpanded: true,
                  //     value: selectedNationality,
                  //     items: nationality
                  //         .map((e) => DropdownMenuItem(
                  //               value: e,
                  //               child: Text(e),
                  //             ))
                  //         .toList(),
                  //     onChanged: (val) {
                  //       setState(() {
                  //         selectedNationality = val as String;
                  //       });
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await Update().setInfo(
                          name: _name.text,
                          address: _address.text,
                          phone: _phone.text,
                          birthday: _birthday.text,
                          gender: selectedgender!,
                          token:
                              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6ImltYWQiLCJlbWFpbCI6ImltYWRmZmZmQGdtYWlsLmNvbSIsImdlbmRlciI6Im1hbGUiLCJpYXQiOjE3MjI4NjE4MDIsImV4cCI6MTcyMzQ2NjYwMn0.IbC06TWIUZgaV5iYZY3ZK1aqpVHNNzqY3ki-GiH9j-4',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 0,
                            content: FlashMessage(
                              title: 'your information..',
                              errorText: 'saved successfully',
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            elevation: 0,
                            content: FlashMessage(
                              errorText: 'you should fill all fields     ',
                            ),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        //initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2025));
    if (picked != null) {
      setState(() {
        _birthday.text = picked.toString().split(" ")[0];
      });
    }
  }
}
