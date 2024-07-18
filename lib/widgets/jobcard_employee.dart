import 'package:flutter/material.dart';

class JobCardEmployee extends StatelessWidget {
  final String jobLevel;
  final String jobRole;
  final String jobType;
  final String companyName;

  const JobCardEmployee(
      {super.key,
      required this.jobLevel,
      required this.jobRole,
      required this.jobType,
      required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              companyName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 92, 89, 89)),
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
                const Icon(Icons.bar_chart,
                    color: Color.fromARGB(107, 94, 114, 226)),
                const SizedBox(width: 20),
                const Text('Job Level:'),
                const SizedBox(width: 20),
                Text(jobLevel),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(Icons.schedule,
                    color: Color.fromARGB(107, 94, 114, 226)),
                const SizedBox(width: 20),
                const Text('Job Type:'),
                const SizedBox(width: 20),
                Text(jobType),
                const Spacer(),
                //  const SizedBox(width: 80),
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
