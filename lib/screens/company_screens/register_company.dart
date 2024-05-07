import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/textField.dart';
import 'package:flutter/material.dart';

class ResisterCompanyScreen extends StatefulWidget {
  ResisterCompanyScreen({super.key});

  @override
  State<ResisterCompanyScreen> createState() => _ResisterCompanyScreenState();
}

class _ResisterCompanyScreenState extends State<ResisterCompanyScreen> {
  final TextEditingController _companyName = TextEditingController();
  String city = 'Select location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        backgroundColor: AppColors.mainColor,
        title: const Text(
          'COMPANY\n I N F O R M A T I O N',
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
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              customTextField(
                title: 'Company Name',
                hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyName,
                border: 10,
              ),
              SizedBox(
                height: 10,
              ),
              customTextField(
                title: 'Company Name',
                hint: 'Type Here please',
                maxLines: 1,
                borderColor: AppColors.amber,
                controller: _companyName,
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
                      'Company Location',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(city),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
