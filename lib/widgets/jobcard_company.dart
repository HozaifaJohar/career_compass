import 'package:career_compass/models/job.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JobCardCompany extends StatelessWidget {
  final String jobTitle;
  final List<Static> jobStatic;

  const JobCardCompany({
    super.key,
    required this.jobTitle,
    required this.jobStatic,
  });

  @override
  Widget build(BuildContext context) {
    final categoricJobStatic =
        jobStatic.where((item) => item.type == 'category').toList();
    final jobType =
        jobStatic.firstWhere((item) => item.type == 'job type').name;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Color.fromARGB(107, 94, 114, 226),
                ),
                const SizedBox(width: 20),
                const Text('JobTitle:'),
                const SizedBox(width: 20),
                Text(jobTitle),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.work,
                  color: Color.fromARGB(107, 94, 114, 226),
                ),
                const SizedBox(width: 20),
                const Text('JobRole:'),
                const SizedBox(width: 20),
                Row(
                  children: [
                    for (final item in categoricJobStatic)
                      Text('${item.name} , '),
                    // Add any additional spacing or icons here if needed
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.lock_clock,
                  color: Color.fromARGB(107, 94, 114, 226),
                ),
                const SizedBox(width: 20),
                const Text('JobType:'),
                const SizedBox(width: 20),
                Text(jobType),
                const Spacer(),
                const Icon(
                  Icons.arrow_circle_right,
                  color: Color.fromARGB(154, 246, 133, 35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
