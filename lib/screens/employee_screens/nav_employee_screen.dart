import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/provider/onTap_nav_employee.dart';

import 'package:career_compass/screens/employee_screens/filter_employee_screen.dart';
import 'package:career_compass/screens/employee_screens/home_employee.dart';
import 'package:career_compass/screens/employee_screens/notification_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationEmployeeScreen extends StatelessWidget {
  const NavigationEmployeeScreen({super.key});

  final List<Widget> _pagesList = const [
    HomePageEmployee(),
    FilterEployeeScreen(),
    NotificationEmployeeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<OntapNavigationEmployee>(
        builder: (context, value, child) {
          return _pagesList[value.index];
        },
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: AppColors.mainColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('./images/profilePhoto.jpg'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    'email@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  ListTile(
                    title: const Text('Change Password'),
                    leading: const Icon(Icons.lock),
                    onTap: () {
                      Navigator.pushNamed(context, '/changePassword_employee');
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
                      Navigator.pushNamed(context, '/filterJobs_employee');
                    },
                  ),
                  ListTile(
                    title: const Text('Applied Jobs'),
                    leading: const Icon(Icons.work),
                    onTap: () {
                      Navigator.pushNamed(context, '/appliedJobs_employee');
                    },
                  ),
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
                      CashMemory()
                          .daleteCashItem(key: 'accessToken')
                          .then((value) {
                        Navigator.pushNamed(context, '/login_screen');
                      }).catchError((error) {});
                      // LogEmployeeService().logOut(
                      //     accessToken:
                      //         CashMemory().getCashData(key: 'accessToken'));
                    },
                  ),
                  ListTile(
                    title: const Text('Change Language'),
                    leading: const Icon(Icons.language),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<OntapNavigationEmployee>(
        builder: (context, value, child) {
          return CurvedNavigationBar(
            height: 60,
            index: value.index,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppColors.mainColor,
            color: AppColors.mainColor,
            animationDuration: const Duration(milliseconds: 300),
            items: const <Widget>[
              Icon(Icons.home, size: 26, color: Colors.white),
              Icon(Icons.filter_alt_sharp, size: 26, color: Colors.white),
              Icon(Icons.notifications, size: 26, color: Colors.white),
            ],
            onTap: (n) {
              value.setIndex(n);
            },
          );
        },
      ),
    );
  }
}
