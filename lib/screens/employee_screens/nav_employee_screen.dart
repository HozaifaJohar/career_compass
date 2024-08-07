import 'package:career_compass/provider/employee/onTap_nav_employee.dart';
import 'package:career_compass/screens/employee_screens/drawer_main_employee.dart';

import 'package:career_compass/screens/employee_screens/filter_employee_screen.dart';
import 'package:career_compass/screens/employee_screens/home_employee.dart';
import 'package:career_compass/screens/employee_screens/notification_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/waves.dart';

class NavigationEmployeeScreen extends StatefulWidget {
  const NavigationEmployeeScreen({super.key});

  @override
  State<NavigationEmployeeScreen> createState() =>
      _NavigationEmployeeScreenState();
}

class _NavigationEmployeeScreenState extends State<NavigationEmployeeScreen> {
  final List<Widget> _pagesList = [
    FilterEployeeScreen(),
    const HomePageEmployee(),
    const NotificationEmployeeScreen(),
  ];
  @override
  void initState() {
    Provider.of<OntapNavigationEmployee>(context, listen: false).newIndex(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<OntapNavigationEmployee>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 140,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 120,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.31,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: provider.pageController,
              children: List.generate(
                _pagesList.length,
                (index) => _pagesList[index],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerEmployee(),
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
              Icon(Icons.filter_alt_sharp, size: 26, color: Colors.white),
              Icon(Icons.home, size: 26, color: Colors.white),
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
//fffffffff