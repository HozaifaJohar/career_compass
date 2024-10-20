import 'package:career_compass/screens/employee_screens/otp_employee.dart';
import 'package:career_compass/services/employee/employee_auth/register_employee_service.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RegisterEmployeeScreen extends StatefulWidget {
  final String email;
  final String password;
  const RegisterEmployeeScreen(
      {super.key, required this.email, required this.password});

  @override
  State<RegisterEmployeeScreen> createState() => _RegisterEmployeeScreenState();
}

class _RegisterEmployeeScreenState extends State<RegisterEmployeeScreen> {
  _RegisterEmployeeScreenState() {
    selectedCity = city[0];
    selectedgender = gender[0];
    selectedNationality = nationality[0];
  }

  final city = ['Damascus', 'Hama', 'Homs', 'Aleppo', 'Daraa'];
  String selectedCity = "";
  final gender = ['male', 'female'];
  String selectedgender = "";
  final nationality = ['Syrian', 'Indian'];
  String selectedNationality = "";
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _home = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _fullname.dispose();
    _phone.dispose();
    _home.dispose();
    super.dispose();
  }

  final _formKey1 = GlobalKey<FormState>();
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
                Form(
                  key: _formKey1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        title: 'Full Name',
                        maxLines: 1,
                        borderColor: AppColors.amber,
                        controller: _fullname,
                        border: 10,
                        validateMessage: 'please enter full name',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        title: 'Home Address',
                        maxLines: 1,
                        borderColor: AppColors.amber,
                        controller: _home,
                        border: 10,
                        validateMessage: 'please enter your home address',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        title: 'Mobile Phone',
                        maxLines: 1,
                        borderColor: AppColors.amber,
                        controller: _phone,
                        border: 10,
                        validateMessage: 'please enter your mobile phone',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                            labelText: 'Birthday',
                            filled: true,
                            prefixIcon: Icon(Icons.calendar_today),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.amber))),
                        readOnly: true,
                        onTap: () {
                          _selectDate();
                        },
                        validator: (value) =>
                            value!.isEmpty ? 'please select date' : null,
                      ),
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
                      CustomTextField(
                          title: 'Description',
                          maxLines: 3,
                          controller: description,
                          border: 20,
                          borderColor: AppColors.amber,
                          validateMessage:
                              'Enter description about you please'),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
                customButton(
                    tap: () {
                      if (_formKey1.currentState!.validate()) {
                        Provider.of<RegisterEmployeeSrevice>(context,
                                listen: false)
                            .register(
                          name: _fullname.text,
                          email: widget.email,
                          password: widget.password,
                          gender: selectedgender,
                          phone: _phone.text,
                          homeAddress: homeAddress,
                          birthDayDate: _dateController.text,
                          description: description.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OtpEmployee(email: widget.email),
                          ),
                        );
                      }
                    },
                    text: 'Continue',
                    context: context,
                    width: double.infinity)
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
