import 'dart:ui';

import 'package:career_compass/models/applied_emp.dart';
import 'package:career_compass/services/company/patch_emp.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/flash_message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeDetails extends StatelessWidget {
  final AppliedEmployee emp;
  const EmployeeDetails({super.key, required this.emp});

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(243, 74, 72, 72);
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Name: \n${emp.employee.name}',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Description: \n${emp.employee.description}',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Email: \n${emp.employee.email}',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Home Address: \n${emp.employee.homeAddress}',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Phone: \n${emp.employee.phone}',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Education: \n${emp.employee.education}',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Experience: \n${emp.employee.experience} years',
                          style: const TextStyle(color: color),
                        ),
                        const SizedBox(height: 20),
                        // Add any other relevant information here
                      ],
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
                        bool i =
                            await patch.patchemp(emp.employee.id, emp.job.id);

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