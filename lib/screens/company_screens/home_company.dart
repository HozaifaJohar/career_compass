import 'package:career_compass/provider/onTap_nav_company.dart';
import 'package:career_compass/screens/company_screens/companyjob_details.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_company.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePageCompany extends StatelessWidget {
  const HomePageCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const CompanyJobDetails()));
        //   },
        //   child: const Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: JobCardCompany(
        //       jobTitle: 'FRONT END',
        //       jobRole: 'IT/Special',
        //       jobType: 'Full Time',
        //     ),
        //   ),
        // ),

        Image.asset('images/man.gif'),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          width: 200,
          child: MaterialButton(
            color: AppColors.mainColor,
            onPressed: () {
              Provider.of<OntapNavigationCompany>(context, listen: false)
                  .setIndex(1);
            },
            child: const Center(
              child: Text(
                'Add New Job',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
