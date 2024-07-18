import 'package:career_compass/provider/employee/gets_provider_employee.dart';
import 'package:career_compass/style/app_colors.dart';
import 'package:career_compass/widgets/jobcard_employee.dart';
import 'package:career_compass/widgets/waves.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePageEmployee extends StatefulWidget {
  const HomePageEmployee({super.key});

  @override
  State<HomePageEmployee> createState() => _HomePageEmployeeState();
}

class _HomePageEmployeeState extends State<HomePageEmployee> {
  // :=) in state we use initState...
  // we put listen false out the build, in the build() we do not have to add listen:false when we use provider
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetProviderEmployee>(context, listen: false).getAllJobs();
    });
    super.initState();
  }

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
        Consumer<GetProviderEmployee>(
          builder: (contxt, value, child) {
            if (value.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final jobs = value.jobs;
            return Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: jobs.length,
                      (context, index) {
                        final job = jobs[index];
                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: JobCardEmployee(
                              jobRole: 'it',
                              jobType: 'Full time',
                              jobLevel: 'Junior Profissional',
                              companyName: 'Google Company'),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ),

        // Consumer<GetProviderEmployee>(
        //   builder: (context, value, child) {
        //     final jobs = value.jobs;
        //     return GestureDetector(
        //       onTap: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => const EmployeJobDetails(),
        //           ),
        //         );
        //       },
        //       child: ListView.builder(
        //         itemCount: jobs.length,
        //         itemBuilder: (context, index) {
        //           final job = jobs[index];
        //           return Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: JobCardEmployee(
        //                 jobRole: 'IT SPECIAL',
        //                 jobType: 'Full time',
        //                 jobLevel: 'Junior Profissional',
        //                 companyName: 'Google Company'),
        //           );
        //         },
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }
}
