import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/screens/employee_screens/jobemplyee_details.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/material.dart';

class JobCardEmployee extends StatelessWidget {
  final List<Static> statics;
  final List<SubCategory> subCategories;
  final Company company;
  final String description;
  final String title;
  final int salary;
  final String gender;
  final int id;

  const JobCardEmployee(
      {super.key,
      required this.statics,
      required this.company,
      required this.subCategories,
      required this.description,
      required this.title,
      required this.salary,
      required this.gender,
      required this.id});

  @override
  Widget build(BuildContext context) {
    final companyName = company.companyName;
    final jobLevel =
        statics.firstWhere((element) => element.type == 'level').name;
    final jobType =
        statics.firstWhere((element) => element.type == 'job type').name;
    List<String> categories = [];
    for (var map in statics) {
      if (map.type == 'category') {
        categories.add(map.name);
      }
    }

    return InkWell(
      splashColor: AppColors.mainColor.withAlpha(50),
      highlightColor: AppColors.mainColor.withAlpha(30),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
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
                const Icon(
                  Icons.work,
                  color: Color.fromARGB(107, 94, 114, 226),
                ),
                const SizedBox(width: 20),
                const Text('JobRole:'),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    categories.join(', '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.bar_chart,
                  color: Color.fromARGB(107, 94, 114, 226),
                ),
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
                const Icon(
                  Icons.arrow_circle_right,
                  color: Color.fromARGB(154, 246, 133, 35),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EmployeJobDetails(
              categories: categories,
              jobLevel: jobLevel,
              jobType: jobType,
              description: description,
              salary: salary,
              subCategories: subCategories,
              title: title,
              gender: gender,
              company: company,
              id: id,
            ),
          ),
        );
      },
    );
  }
}
