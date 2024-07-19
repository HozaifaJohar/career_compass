import 'dart:ui';

import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/widgets/line_in_detail_emp.dart';
import 'package:flutter/material.dart';

class EmployeJobDetails extends StatelessWidget {
  final List<String> categories;
  final String jobLevel;
  final String jobType;
  final String description;
  final List<SubCategory> subCategories;
  final int salary;
  final String title;
  final String gender;
  final Company company;

  const EmployeJobDetails({
    super.key,
    required this.categories,
    required this.jobLevel,
    required this.jobType,
    required this.description,
    required this.salary,
    required this.subCategories,
    required this.title,
    required this.gender,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final listSubCategories = subCategories.map((e) => e.name).toList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF5E72E2),
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight / 5,
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight / 5,
                  decoration: const BoxDecoration(
                    color: Color(0xFF5E72E2),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: const Center(
                    child: Text(
                      'Job Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: screenHeight / 1.5,
                decoration: const BoxDecoration(color: Color(0xFF5E72E2)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: screenHeight / 1.25,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70))),
                child: Padding(
                  padding: const EdgeInsets.all(34.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight / 5.5,
                        ),
                        CustomLine(
                          leftText: 'Job Role:',
                          rightText: categories.join(', '),
                          icon: Icons.work,
                        ),
                        CustomLine(
                          leftText: 'Qualifications',
                          rightText: listSubCategories.join(', '),
                          icon: Icons.workspace_premium,
                        ),
                        CustomLine(
                          leftText: 'Job Level:',
                          rightText: jobLevel,
                          icon: Icons.school,
                        ),
                        CustomLine(
                          leftText: 'Job Type:',
                          rightText: jobType,
                          icon: Icons.schedule,
                        ),
                        CustomLine(
                          leftText: 'Salary:',
                          rightText: '$salary',
                          icon: Icons.monetization_on,
                        ),
                        CustomLine(
                          leftText: 'Gender',
                          rightText: gender,
                          icon: Icons.wc,
                        ),
                        CustomLine(
                          leftText: 'Description:',
                          rightText: description,
                          icon: Icons.text_decrease,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: MaterialButton(
                            onPressed: () {},
                            color: const Color.fromARGB(107, 94, 114, 226),
                            child: const Center(
                              child: Text(
                                'Applay',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
