import 'dart:math';

import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_company.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoriesJob extends StatelessWidget {
  final List<JobEmployee> jobs;
  final String title;
  const CategoriesJob({super.key, required this.jobs, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: jobs.length,
                (context, index) {
                  final job = jobs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: JobCardEmployee(
                      statics: job.statics,
                      company: job.company,
                      subCategories: job.subCategories,
                      description: job.description,
                      title: job.title,
                      salary: job.salary,
                      gender: job.wantedGender,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
