import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class JobCardCompany extends StatelessWidget {
  final String jobTitle;
  final String jobRole;
  final String jobType;

  const JobCardCompany(
      {super.key,
      required this.jobTitle,
      required this.jobRole,
      required this.jobType});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.work,
                    color: Color.fromARGB(107, 94, 114, 226)),
                const SizedBox(width: 20),
                const Text('JobRole:'),
                const SizedBox(width: 20),
                Text(jobRole),
                // const SizedBox(width: 140),
                // const Icon(
                //   Icons.arrow_circle_right,
                //   color: Color(0xffF68623),
                // )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.lock_clock,
                    color: Color.fromARGB(107, 94, 114, 226)),
                const SizedBox(width: 20),
                const Text('JobRole:'),
                const SizedBox(width: 20),
                Text(jobType),
                const Spacer(),
                const Icon(
                  Icons.arrow_circle_right,
                  color: Color.fromARGB(154, 246, 133, 35),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
