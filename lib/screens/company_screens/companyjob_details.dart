import 'package:career_compass/models/job.dart';
import 'package:career_compass/screens/company_screens/accepted.dart';
import 'package:career_compass/screens/company_screens/applied_employees.dart';
import 'package:career_compass/widgets/buttom.dart';
import 'package:career_compass/widgets/details_container.dart';
import 'package:career_compass/widgets/row.dart';
import 'package:flutter/material.dart';

class CompanyJobDetails extends StatelessWidget {
  final Job job;
  const CompanyJobDetails({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final jobRole =
        job.jobStatic.where((item) => item.type == 'category').toList();
    final jobType =
        job.jobStatic.firstWhere((item) => item.type == 'job type').name;
    final jobLevel =
        job.jobStatic.firstWhere((item) => item.type == 'level').name;
    final jobQual = job.subCategories;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        DetailsContainer(jobTitle: job.title),
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
            height: screenHeight / 1.5,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
            child: Padding(
              padding: const EdgeInsets.all(34.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.work,
                            color: Color.fromARGB(107, 94, 114, 226)),
                        const SizedBox(width: 20),
                        const Text('Job Role:'),
                        const SizedBox(width: 20),
                        for (final item in jobRole)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(item.name),
                                const SizedBox(width: 8),
                              ],
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.category,
                            color: Color.fromARGB(107, 94, 114, 226)),
                        const SizedBox(width: 20),
                        const Text('Qualification:'),
                        const SizedBox(width: 20),
                        for (final item in jobQual)
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(item.name),
                                const SizedBox(width: 8),
                              ],
                            ),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RowDetails(
                        firstText: 'Job Level',
                        lastText: jobLevel,
                        iconData: Icons.bar_chart),
                    const SizedBox(
                      height: 20,
                    ),
                    RowDetails(
                        firstText: 'Job Type',
                        lastText: jobType,
                        iconData: Icons.schedule),
                    const SizedBox(
                      height: 20,
                    ),
                    RowDetails(
                        firstText: 'Salary',
                        lastText: job.salary.toString(),
                        iconData: Icons.money),
                    const SizedBox(
                      height: 20,
                    ),
                    RowDetails(
                        firstText: 'Work Hours',
                        lastText: job.workHours.toString(),
                        iconData: Icons.hourglass_bottom),
                    const SizedBox(
                      height: 20,
                    ),
                    RowDetails(
                        firstText: 'Experience Year',
                        lastText: job.experienceYears.toString(),
                        iconData: Icons.school),
                    const SizedBox(
                      height: 20,
                    ),
                    RowDetails(
                        firstText: 'Description',
                        lastText: job.description,
                        iconData: Icons.description),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AppliedEmployeesSecreen(
                                id: job.id,
                              );
                            }));
                          },
                          icon: const Icon(
                            Icons.people,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AcceptedEmpSec(
                                  id: job.id,
                                );
                              }));
                            },
                            icon: const Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customButton(
                        tap: () {
                          Navigator.pop(context);
                        },
                        text: 'Back',
                        status: false,
                        context: context)
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
