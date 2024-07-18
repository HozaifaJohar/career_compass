import 'dart:convert';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/provider/onTap_nav_company.dart';
import 'package:career_compass/screens/company_screens/add_job.dart';
import 'package:career_compass/screens/company_screens/home_company.dart';
import 'package:career_compass/screens/company_screens/notification_company.dart';
import 'package:career_compass/services/company/get_logo.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NavigationCompanyScreen extends StatelessWidget {
  NavigationCompanyScreen({super.key});

  final List<Widget> pagesList = const [
    HomePageCompany(),
    AddJob(),
    NotificationCompanyScreen(),
  ];

  String? _imagePath;

  String url = AppString.baseUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Consumer<OntapNavigationCompany>(
        builder: (BuildContext context, OntapNavigationCompany value,
            Widget? child) {
          return pagesList[value.index];
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
                  FutureBuilder<String?>(
                      future: GetLogo().getLogo(),
                      builder: (context, snapshot) {
                        _imagePath = snapshot.data;
                        return Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'http://10.0.2.2:3000/$_imagePath')
                                  //           //  AssetImage('./images/profilePhoto.jpg'),
                                  ),
                            ),
                          ),
                        );
                      }),

                  //  _imagePath != null
                  //     ? Image.network('$url/$_imagePath!')
                  //     : const CircularProgressIndicator(),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 30),
                  //   child: Container(
                  //     height: 90,
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           image: NetworkImage(
                  //               'http://10.0.2.2:3000/uploadsimages/7e518bfce27b9263bdfb54aba1398e8d.jpg')
                  //           //           //  AssetImage('./images/profilePhoto.jpg'),
                  //           ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  const Text(
                    'Company Name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Text(
                    'companyEmail@gmail.com',
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
                      Navigator.pushNamed(context, '/changePassword_company');
                    },
                  ),
                  ListTile(
                    title: const Text('Company Information'),
                    leading: const Icon(
                      Icons.info,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/changeInfo_company');
                    },
                  ),
                  ListTile(
                    title: const Text('Upload Company Logo'),
                    leading: const Icon(Icons.image),
                    onTap: () {
                      Navigator.pushNamed(context, '/upload_logo');
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
                        Navigator.pushNamed(context, '/start_screen');
                      }).catchError((error) {});
                    },
                  ),
                  ListTile(
                    title: const Text('Change Language'),
                    leading: const Icon(Icons.language),
                    onTap: () async {
                      // GetLogo().getLogo();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
