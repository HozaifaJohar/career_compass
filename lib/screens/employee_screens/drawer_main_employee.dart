import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/models/user_employee.dart';
import 'package:career_compass/provider/employee/onTap_nav_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/exam_screen.dart';
import 'package:career_compass/screens/employee_screens/drawer_employee_screens/exam_state.dart';
import 'package:career_compass/screens/start.dart';
import 'package:career_compass/services/employee/employee_requests/get_image.dart';
import 'package:career_compass/services/employee/employee_requests/get_info.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:provider/provider.dart';

class DrawerEmployee extends StatefulWidget {
  const DrawerEmployee({super.key});

  @override
  State<DrawerEmployee> createState() => _DrawerEmployeeState();
}

class _DrawerEmployeeState extends State<DrawerEmployee> {
  late Future<UserEmployee> futureUser;
  String? _imagePath;
  String token = CashMemory().getCashData(key: 'accessToken');
  @override
  void initState() {
    futureUser = Info().get(
      token: token,
    );
    futureUser.then((userData) {
      setState(() {
        // user = userData;
        // _name.text = user!.name;
        // _address.text = user!.homeAddress;
        // _phone.text = user!.phone;
        // _birthday.text = user!.birthdayDate;
        // selectedgender = user!.gender;
        // print(selectedgender);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final url = AppString.baseUrl;
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: AppColors.mainColor,
          child: Column(
            children: [
              FutureBuilder(
                  future: GetImage().getImage(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _imagePath = snapshot.data;
                      return Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage('$url/$_imagePath'),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 203, 202, 202)),
                          width: 90,
                          height: 90,
                          child: const Center(child: Icon(Icons.person)),
                        ),
                      );
                    }
                  }),
              const SizedBox(height: 10),
              const Text(
                'Hozaifa Jawhar',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Text(
                'hozaifajawhar@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey[100]),
              ),
            ],
          ),
        ),
        Flexible(
          child: ListView(
            children: [
              ListTile(
                title: const Text('Exams'),
                leading: const Icon(Icons.quiz),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ExamsState();
                  }));
                },
              ),
              ListTile(
                title: const Text('Your Information'),
                leading: const Icon(
                  Icons.person,
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/changeInfo_employee');
                },
              ),
              ListTile(
                title: const Text('Filter Jobs'),
                leading: const Icon(Icons.filter_alt_sharp),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, '/filterJobs_employee');
                },
              ),
              // ListTile(
              //   title: const Text('Applied Jobs'),
              //   leading: const Icon(Icons.work),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/appliedJobs_employee');
              //   },
              // ),
              ListTile(
                title: const Text('Upload Profile Photo'),
                leading: const Icon(Icons.image),
                onTap: () {
                  Navigator.pushNamed(context, '/uploadPhoto_employee');
                },
              ),
              ListTile(
                title: const Text('Upload Your CV'),
                leading: const Icon(Icons.description),
                onTap: () {
                  Navigator.pushNamed(context, '/upload_cv');
                },
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
                height: 40,
                indent: 25,
                endIndent: 25,
              ),
              ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.login),
                onTap: () {
                  Provider.of<OntapNavigationEmployee>(context, listen: false)
                      .setIndex(1);
                  CashMemory().daleteCashItem(key: 'accessToken');
                  Navigator.pushNamed(context, '/start_screen');
                },
              ),
              // ListTile(
              //   title: const Text('Change Language'),
              //   leading: const Icon(Icons.language),
              //   onTap: () {},
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
