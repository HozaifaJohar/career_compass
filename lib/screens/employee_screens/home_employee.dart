import 'package:career_compass/screens/employee_screens/jobemplyee_details.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageEmployee extends StatelessWidget {
  const HomePageEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    height: 140,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 120,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmployeJobDetails()));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: JobCardEmployee(
                  jobRole: 'IT SPECIAL',
                  jobType: 'Full time',
                  jobLevel: 'Junior Profissional',
                  companyName: 'Google Company'),
            ),
          )
        ],
      ),
    );
  }
}
