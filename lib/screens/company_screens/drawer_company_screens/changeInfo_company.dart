import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textField.dart';
import 'package:flutter/material.dart';

class ChangeInformationCompany extends StatefulWidget {
  const ChangeInformationCompany({super.key});

  @override
  State<ChangeInformationCompany> createState() =>
      _ChangeInformationCompanyState();
}

class _ChangeInformationCompanyState extends State<ChangeInformationCompany> {
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _companyPhone = TextEditingController();
  final TextEditingController _describtion = TextEditingController();
  String city = 'Select location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'E d i t\n I N F O R M A T I O N',
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
                height: 20,
              ),
              CustomTextField(
                title: 'Company Name',
                hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyName,
                border: 10,
                val: (value) {
                  if (value!.isEmpty) {
                    return 'pleas enter company name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Company Phone',
                hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyPhone,
                border: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 222, 219, 219),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView(
                              children: <Widget>[
                                ListTile(
                                  title: const Text(
                                    'Damascus',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Damascus';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Lattakia',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Lattakia';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Homs',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Homs';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Hama',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Hama';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Aleppo',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Aleppo';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Tartous',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Tartous';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text(
                                    'Daraa',
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      city = 'Daraa';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 230, 230),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    title: const Text(
                      'City',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(city),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                title: 'Address',
                hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyPhone,
                border: 10,
                val: (value) {
                  if (value!.isEmpty) {
                    return 'pleas enter company address ';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                title: 'Describe your company',
                minLines: 3,
                maxLines: 4,
                borderColor: AppColors.amber,
                controller: _describtion,
                border: 10,
                val: (value) {
                  if (value!.isEmpty) {
                    return 'pleas descripe your company at least in one line ';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'home_company',
                  );
                },
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
        ),
      ),
    );
  }
}
