import 'dart:ui';

import 'package:career_compass/constant/url.dart';
import 'package:career_compass/models/applied_emp.dart';
import 'package:career_compass/services/company/patch_emp.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/test.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class EmployeeDetails extends StatelessWidget {
  final AppliedEmployee emp;
  final int id;
  const EmployeeDetails({super.key, required this.emp, required this.id});

  @override
  Widget build(BuildContext context) {
    final url = AppString.baseUrl;
    const color = Color.fromARGB(243, 128, 122, 122);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              AppColors.mainColor,
              Color.fromARGB(255, 67, 87, 202),
            ]),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 500,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: const BorderSide(color: AppColors.mainColor)),
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Employee Name:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          Text(emp.employee.name),
                          const SizedBox(height: 20),
                          const Text(
                            'Description:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          Text(emp.employee.description),
                          const SizedBox(height: 20),
                          const Text(
                            'Email:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          Text(emp.employee.email),
                          const SizedBox(height: 20),
                          const Text(
                            'Home Address:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          Text(emp.employee.homeAddress),
                          const SizedBox(height: 20),
                          const Text(
                            'Phone:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          Text(emp.employee.phone),
                          const SizedBox(height: 20),
                          const Text(
                            'Certafication in java:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              for (final item in emp.certifications)
                                Text('${item.name} : ${item.mark}'),
                              // Add any additional spacing or icons here if needed
                            ],
                          ),
                          //    Text('${emp.certifications}'),
                          const SizedBox(height: 20),
                          const Text(
                            'Experience:',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.bold),
                          ),
                          emp.employee.experience == null
                              ? const Text('None')
                              : Text('${emp.employee.experience} years'),
                          const SizedBox(height: 20),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PdfViewerPage(
                                      url:
                                          '$url/uploadsFiles/${emp.employee.resume}');
                                }));
                              },
                              child: Text(
                                'Display ${emp.employee.name} CV',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainColor),
                              ))
                          // Add any other relevant information here
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<PatchEmp>(
                builder: (context, patch, child) {
                  return customButton(
                      tap: () async {
                        print('object');
                        bool i = await patch.patchemp(emp.employee.id, id);
                        print('2');
                        if (!i) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 0,
                              content: FlashMessage(
                                errorText: patch.resMessage,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        }
                      },
                      text: 'Accept',
                      context: context,
                      width: 150);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// IconButton(
//   onPressed: () async {
//     bool i = await PatchEmp().patchemp(emp.employee.id, emp.job.id);
//   },
//   icon: const Icon(Icons.abc),
// ),
