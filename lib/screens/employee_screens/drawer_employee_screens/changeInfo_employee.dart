import 'package:career_compass/style/app_colors.dart';

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
    selectedCity = city[0];
    selectedgender = gender[0];
    selectedNationality = nationality[0];
  }
  final city = ['Damascus', 'Hama', 'Homs', 'Aleppo', 'Daraa'];
  String selectedCity = "";
  final gender = ['Male', 'Famale'];
  String selectedgender = "";
  final nationality = ['Syrian', 'Indian'];
  String selectedNationality = "";
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _firstname = TextEditingController();
  //final TextEditingController _lastname = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _home = TextEditingController();

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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  title: 'Full Name',
                  maxLines: 1,
                  borderColor: AppColors.amber,
                  controller: _firstname,
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
                  controller: _home,
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: DropdownButton(
                    isExpanded: true,
                    value: selectedNationality,
                    items: nationality
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedNationality = val as String;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_company');
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/scientific_information');
                    },
                    child: Container(
                      width: 100,
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
