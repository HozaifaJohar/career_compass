import 'package:career_compass/core/shared_preferences.dart';
import 'package:career_compass/services/company/get_logo.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerCompany extends StatelessWidget {
  DrawerCompany({super.key});
  String? _imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                                image: NetworkImage(
                                    'http://10.0.2.2:3000/$_imagePath')
                                //           //  AssetImage('./images/profilePhoto.jpg'),
                                ),
                          ),
                        ),
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          child: Center(child: Icon(Icons.person)),
                        ),
                      );
                    }
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
                  CashMemory().daleteCashItem(key: 'accessToken').then((value) {
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
    );
  }
}
