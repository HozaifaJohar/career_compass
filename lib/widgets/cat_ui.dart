import 'package:career_compass/models/employee/job_employee.dart';
import 'package:career_compass/screens/employee_screens/all_job_category.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// class CategoryUim {
//   final int id;
//   final String name;
//   final IconData icon;
//  // final Future<List<JobEmployee>> jobCategory;
//   CategoryUim(this.id, this.icon, this.name,);

// }

// List<CategoryUim> category = [
//   CategoryUim(1, CupertinoIcons.desktopcomputer, 'IT'),
//   CategoryUim(2, CupertinoIcons.money_dollar, 'Banking'),
//   CategoryUim(3,   CupertinoIcons.paintbrush, 'Graphic Designe'),
//   CategoryUim(3, CupertinoIcons.book, 'Education'),

// ];
class CategoryUi extends StatelessWidget {
  final String name;
  final IconData icon;
  final List<JobEmployee> jobs;
  const CategoryUi(
      {super.key, required this.icon, required this.name, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CategoriesJob(jobs: jobs,title: name,);
              }));
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppColors.mainColor),
                  color: const Color.fromARGB(203, 222, 220, 220)),
              child: Icon(
                icon,
                size: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name)
        ],
      ),
    );
  }
}
