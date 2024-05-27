import 'package:career_compass/screens/employee_screens/otp_employy.dart';
import 'package:career_compass/services/employee/register_employee_service.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textField.dart';
import 'package:flutter/material.dart';

class RegisterEmployeeScreen extends StatefulWidget {
  final String? email;
  final String? password;
  const RegisterEmployeeScreen({super.key, this.email, this.password});

  @override
  State<RegisterEmployeeScreen> createState() => _RegisterEmployeeScreenState();
}

class _RegisterEmployeeScreenState extends State<RegisterEmployeeScreen> {
  String? _email;
  String? _password;
  @override
  void initState() {
    _email = widget.email;
    _password = widget.password;
    super.initState();
  }

  _RegisterEmployeeScreenState() {
    selectedCity = city[0];
    selectedgender = gender[0];
    selectedNationality = nationality[0];
  }

  final city = ['Damascus', 'Hama', 'Homs', 'Aleppo', 'Daraa'];
  String selectedCity = "";
  final gender = ['male', 'famale'];
  String selectedgender = "";
  final nationality = ['Syrian', 'Indian'];
  String selectedNationality = "";
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _home = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String homeAddress = '${_home.text}/$selectedCity';
    return Scaffold(
        appBar: AppBar(
          elevation: 15,
          backgroundColor: AppColors.mainColor,
          title: const Text(
            'YOUR\n I N F O R M A T I O N',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                    title: 'Full Name',
                    hint: 'Type Here please',
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    controller: _fullname,
                    border: 10),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                    title: 'Home Address',
                    hint: 'Type Here please',
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    controller: _home,
                    border: 10),
                const SizedBox(
                  height: 15,
                ),
                customTextField(
                    title: 'Mobile Phone',
                    hint: 'Type Here please',
                    maxLines: 1,
                    borderColor: AppColors.amber,
                    controller: _phone,
                    border: 10),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedCity,
                    items: city
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedCity = val as String;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down_circle),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                      labelText: 'Birthday',
                      filled: true,
                      prefixIcon: const Icon(Icons.calendar_today),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedgender,
                    items: gender
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedgender = val as String;
                      });
                    },
                    icon: const Icon(Icons.person_rounded),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const OtpEmployee();
                    }));
                    print(homeAddress);
                    RegisterEmployeeSrevice().register(
                        name: _fullname.text,
                        email: _email!,
                        password: _password!,
                        gender: selectedgender,
                        phone: _phone.text,
                        homeaddress: homeAddress,
                        birthdayDate: _dateController.text);
                  },
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
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
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }
}
