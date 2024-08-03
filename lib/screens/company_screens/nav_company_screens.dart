import 'package:career_compass/constant/url.dart';
import 'package:career_compass/provider/company/onTap_nav_company.dart';
import 'package:career_compass/screens/company_screens/add_job.dart';
import 'package:career_compass/screens/company_screens/drawer_main_company.dart';
import 'package:career_compass/screens/company_screens/home_company.dart';
import 'package:career_compass/screens/company_screens/notification_company.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationCompanyScreen extends StatelessWidget {
  NavigationCompanyScreen({super.key});

  final List<Widget> pagesList = const [
    HomePageCompany(),
    AddJob(),
    NotificationCompanyScreen(),
  ];

  final String url = AppString.baseUrl;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<OntapNavigationCompany>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
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
            height: screenHeight / 1.31,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: provider.pageController,
              children:
                  List.generate(pagesList.length, (index) => pagesList[index]),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerCompany(),
      ),
      bottomNavigationBar: Consumer<OntapNavigationCompany>(
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
              Icon(Icons.add, size: 26, color: Colors.white),
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
