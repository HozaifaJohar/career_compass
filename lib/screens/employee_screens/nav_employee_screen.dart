import 'package:career_compass/provider/onTap_nav_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_main_screen.dart';

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
      drawer: const Drawer(
        child: DrawerScreen(),
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
